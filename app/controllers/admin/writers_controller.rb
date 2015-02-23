class Admin::WritersController < ApplicationController

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
      respond_with(:admin, @writer)
    end
  end

  def update
    @writer = Writer.find(params[:id])
    @writer.update(writer_params)
    respond_with(:admin, @writer)
  end

  def destroy
  end

  private

    def writer_params
      params.require(:writer).permit(:name, :email)
    end
end
