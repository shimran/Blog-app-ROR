class PostsController <ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(post_params)
    if @posts.save
      flash[:notice] = "Post was added successfully."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @posts = Post.find(params[:id])
  end

  def update
    @posts = Post.find(params[:id])
    if @posts.update(post_params)
      flash[:notice] = "Post updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    flash[:notice] = "Post deleted"
    redirect_to posts_path
  end

  def show
    @posts = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :name)
  end
end
