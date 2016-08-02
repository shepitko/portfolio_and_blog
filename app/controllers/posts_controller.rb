class PostsController < ApplicationController
  before_action :load_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, except: [:show, :index]
  respond_to :html
  responders :flash
  def index
    @posts = Post.all
  end
  
  def show
  end
  
  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_with @post
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  private
  def post_params
    params.require(:post).permit(:post_img, :title, :content)
  end

  def load_post
    @post = Post.find(params[:id])
  end

  def authorize_admin
    if user_signed_in?
      redirect_to posts_path, alert: 'Admins only!' unless current_user.admin?
    else
      redirect_to posts_path, alert: 'Admins only!'
    end
  end
end
