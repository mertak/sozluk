class Admin::WritersController < Admin::BaseController

  respond_to :html

  def index
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
      flash[:danger] = "Boyle bir yazar yok!"
      redirect_to(:back)
    end
  end

  def update
    @writer = Writer.find(params[:id])
    @writer.update(writer_params)
    respond_with(:admin, @writer)
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
