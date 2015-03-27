class CommentsController <ApplicationController
  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(post_params)
    if @comment.save
      flash[:notice] = "Comment was added successfully."
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(post_params)
      flash[:notice] = "Comment updated"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted"
    redirect_to posts_path
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :description)
  end
end
