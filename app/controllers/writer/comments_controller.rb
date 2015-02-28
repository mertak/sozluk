class Writer::CommentsController < Writer::BaseController

  def index
    @comment = current_writer.comments.new
    @comments = Comments.all
  end

  def new
  end

  def create
  end

  def show
  end


end

