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
      it 'saves the new post in the database' do
        expect { post :create, params: {post: attributes_for(:post)} }.to change(Post, :count).by(1)
      end
      it 'redirect to show page' do
        post :create, params: {post: attributes_for(:post)}
        expect(response).to redirect_to(post_path(assigns(:post)))
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
    context 'valid attributes' do
      it 'assigns the requested post to @post' do
        patch :update, params: { id: post, post: attributes_for(:post) }
        expect(assigns(:post)).to eq(post)
      end
      it 'changes post attributes' do
        patch :update, params: { id: post, post: {post_img: '/new/path', title:'new title', content: 'new content'} }
        post.reload
        expect(post.post_img).to eq('/new/path')
        expect(post.title).to eq('new title')
        expect(post.content).to eq('new content')
      end
      it 'redirect to the updated post' do
        patch :update, params: { id: post, post: attributes_for(:post) }
        expect(response).to redirect_to(post)
      end
    end

    context 'invalid attributes' do
      before { patch :update, params: { id: post, post: attributes_for(:invalid_post) } }

      it 'does not changes post attributes' do
        post.reload
        expect(post.post_img).to_not eq '/new/path'
        expect(post.title).to_not eq 'new title'
        expect(post.content).to_not eq 'new content'
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
