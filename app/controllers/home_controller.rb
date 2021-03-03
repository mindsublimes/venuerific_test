class HomeController < ApplicationController
  before_action :authenticate_user!
  
  before_action :get_post, only: [:edit, :update]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    post = Post.new(post_params)
    if post.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit; end
  
  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
  
  def get_post
    @post = Post.find_by(id: params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :description, :author)
  end
end
