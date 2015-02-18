class Writer::PostsController < Writer::BaseController

  respond_to :html

  def new
    @post = current_writer.posts.new
  end

  def index
    @posts = Post.all
    @posts.order(id: :desc)
    @cur_writers_post = Post.find(current_writer)
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

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    respond_with(:writer, @post)
  end

  def edit
  	if current_writer != Post.find(params[:id]).writer
    	respond_to do |format|
    		format.html { redirect_to root_path, notice: "Bu postu düzenleyemezsin.! Defol.!" }
    	end
    else
    	@post = Post.find(params[:id])
    end
  end

  def destroy
  	@post.destroy
  end

  def set_pin
    @pin = current_user.pins.find(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
