class Writer::PostsController < Writer::BaseController
  respond_to :html

  def new
    @post = current_writer.posts.new
  end

  def index
    @search = Post.includes(:writer).ransack(params[:q])
    @posts = @search.result.paginate(page: params[:page])

    @all_posts = Post.order(id: :asc)
    @all_posts.to_json
    #Bazı durumlarda farklı hatalar oldu. Daha iyi bir çözümü olmalı.
    @cur_writers_post = @posts.find_by(id: 1)
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
    @post = Post.find(params[:id])
    if current_writer == @post.writer or !current_admin.nil?
      @post
    else
      respond_to do |format|
        format.html { redirect_to writer_posts_path, notice: "Bu postu duzenleyemezsin.! Defol.!" }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_writer == @post.writer or !current_admin.nil?
      @post.destroy
      redirect_to(:back)
    else	
      respond_to do |format|
    	format.html { redirect_to writer_posts_path, notice: "Bu postu silemezsin.! Defol.!" }
      end
    end
  end

  def set_pin
    @pin = current_user.pins.find(params[:id])
  end

private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
