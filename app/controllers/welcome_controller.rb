class WelcomeController < ApplicationController

  def index
    @search = Post.includes(:writer).ransack(params[:q])
    @search.sorts = ['created_at desc', 'title asc'] if @search.sorts.empty?
    @posts = @search.result.paginate(page: params[:page])
  end

end
