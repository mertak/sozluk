class Admin::DashboardController < ApplicationController

  def index
    @searchw = Writer.ransack(params[:q])
    @w = @searchw.result(distinct: true)
    @searchp = Post.ransack(params[:q])
    @p = @searchp.result(distinct: true)

    @writers = Writer.order(id: :asc)
    @posts = Post.order(id: :desc)
  end

end
