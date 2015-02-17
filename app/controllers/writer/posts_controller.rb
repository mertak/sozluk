class Writer::PostsController < ApplicationController

  def new
    @post = current_writer.posts.new(post_params)
  end

  def index
  end

  def show
  end

  def create
    @post = current_writer.posts.new(post_params)
    if @post.save
      redirect_to :action => :index
    else
      flash.now[:danger] = "Gonderilemedi"
      render 'new'
    end
  end

  def destroy
  end

private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
