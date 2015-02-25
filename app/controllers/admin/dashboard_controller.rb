class Admin::DashboardController < Admin::BaseController

  def index
    @searchp = Post.ransack(params[:q])
    @posts = @searchp.result(distinct: true)

    @all_writers = Writer.order(id: :asc)
    @all_writers.to_json
    @all_posts = Post.order(id: :desc)
    @all_posts.to_json
  end

end
