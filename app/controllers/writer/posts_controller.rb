class Writer::PostsController < Writer::BaseController

  def new
    @post = current_writer.posts.new
  end

  def index
    @posts = Post.all
    @posts.order(id: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_writer.posts.new(post_params)
    if @post.save
      redirect_to action: :index
    else
      flash.now[:danger] = "Gonderilemedi"
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end

private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
