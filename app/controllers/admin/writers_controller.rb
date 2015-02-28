class Admin::WritersController < Admin::BaseController

  respond_to :html

  def index
    @search = Writer.ransack(params[:q])
    @search.sorts = ['email asc', 'created_at desc'] if @search.sorts.empty?
    @writers = @search.result(distinct: true).paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @writer = Writer.find(params[:id])
  end

  def create
  end

  def edit
    @writer = Writer.find(params[:id])
    #TODO: Buraya bir hata sayfası koymalı
    if !@writer
      flash[:warning] = "Boyle bir yazar yok!"
      redirect_to(:back)
    end
  end

  def update
    @writer = Writer.find(params[:id])
    @writer.update(writer_params)
    redirect_to admin_writers_url
  end

  def destroy
    @writer = Writer.find(params[:id])
    @writer.destroy
    redirect_to(:back)
  end

  private

    def writer_params
      params.require(:writer).permit(:name, :email)
    end
end
