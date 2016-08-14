require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'an array of all posts' do
      expect(assigns(:posts)).to match_array(create_list(:post, 2))
    end
    it 'renders index view' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:post){ create(:post) }

    before { get :show, params: {id: post} }

    it 'assigns the requested post to @post' do
      expect(assigns(:post)).to eq(post)
    end

    it 'renders show view' do
      expect(response).to render_template(:show)
    end
  end

  context 'if has admin role' do
    let(:admin) { create(:admin) }
    before(:each) do
      sign_in(admin)
    end
    
    describe 'GET #new' do
      before { get :new }

      it 'assigns a new Post to @post' do
        expect(assigns(:post)).to be_a_new(Post)
      end

      it 'renders show new' do
        expect(response).to render_template(:new)
      end
    end

    describe 'GET #edit' do
      let(:post){ create(:post) }

      before { get :edit, params: {id: post} }

      it 'assigns the requested post to @post' do
        expect(assigns(:post)).to eq(post)
      end

      it 'renders show edit' do
        expect(response).to render_template(:edit)
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        let(:valid_attr) do 
          {title: 'sdfsdf', content:'sdfsdf', img: fixture_file_upload('img/img_file.png', 'image/png'), categories: create(:post).categories }
        end

        it 'saves the new post in the database' do
          expect { post :create, params: { post: valid_attr } }.to change(Post, :count).by(1)
        end

        it 'redirect to show page' do
          post :create, params: {post: valid_attr}
          #expect(response).to redirect_to(post_path(assigns(:post)))
        end
      end

      context 'with invalid attributes' do
        it 'does not save the post' do
          expect { post :create, params: {post: attributes_for(:invalid_post)} }.to_not change(Post, :count)
        end

        it 're-renders new view' do
          post :create, params: { post: attributes_for(:invalid_post) }
          expect(response).to render_template(:new)
        end
      end
    end

    describe 'PATCH #update' do
      let(:post){ create(:post) }
      let(:edit_post){ create(:post) }
      context 'valid attributes' do
        it 'assigns the requested post to @post' do
          patch :update, params: { id: post, post: attributes_for(:post) }
          expect(assigns(:post)).to eq(post)
        end

        it 'changes post attributes' do
          new_post_params = {img_file_name: edit_post.img_file_name, title: edit_post.title, content: edit_post.content}
          patch :update, params: { id: post, post: new_post_params }
          post.reload
          expect(post.img_file_name).to eq(edit_post.img_file_name)
          expect(post.title).to eq(edit_post.title)
          expect(post.content).to eq(edit_post.content)
        end

        it 'redirect to the updated post' do
          patch :update, params: { id: post, post: attributes_for(:post) }
          expect(response).to redirect_to(post)
        end
      end

      context 'invalid attributes' do
        let(:edit_post){ attributes_for(:invalid_post) }
        before { patch :update, params: { id: post, post: attributes_for(:invalid_post) } }

        it 'does not changes post attributes' do
          post.reload
          expect(post.img_file_name).to_not eq(edit_post['img_file_name'])
          expect(post.title).to_not eq(edit_post['title'])
          expect(post.content).to_not eq(edit_post['content'])
        end
        it 're-renders edit view' do
          expect(response).to render_template(:edit)
        end
      end
    end
    describe 'DELETE #destroy' do
      let(:post){ create(:post) }
      before { post }
      it 'deletes post' do
        expect { delete :destroy, params: {id:post} }.to change(Post, :count).by(-1)
      end
      it 'redirect to index view' do
        delete :destroy, params: {id:post}
        expect(response).to redirect_to(posts_path)
      end
    end
  end
end
