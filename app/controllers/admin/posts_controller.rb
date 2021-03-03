class Admin::PostsController < Admin::BaseController
  
  before_action :find_post, only: [:edit, :update, :destroy, :show]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    post = Post.new(post_params)
    if post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end
  
  def edit; end
  
  def update
    if @post.update(post_params)
      redirect_to admin_posts_path
    else
      render :edit
    end
  end
  
  def show; end
  
  def destroy
    if @post.destroy
      redirect_to admin_posts_path
    end
  end
  
  private 
  
  def post_params
    params.require(:post).permit(:title, :description, :author)
  end
  
  def find_post
    @post = Post.find_by(id: params[:id])
  end

end
