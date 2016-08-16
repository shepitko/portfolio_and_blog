class PostsController < ApplicationController
  before_action :load_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, except: [:show, :index]
  
  def index
    @posts = Post.all
    @categories = Category.all
    respond_with @posts, @categories
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    respond_with @post
  end

  def update
    @post.update(post_params)
    respond_with @post
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:img, :title, :content, {category_ids: []})
  end

  def load_post
    @post = Post.find(params[:id])
  end

  def authorize_admin
    redirect_to posts_path, alert: 'Admins only!' unless current_user.try(:admin)
  end
end
