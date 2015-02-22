class Admin::WritersController < ApplicationController

  respond_to :html

  def index
  end

  def show
  end

  def edit
    @writer = Writer.find(params[:id])
    #TODO: Buraya bir hata sayfası koymalı
    if !@writer
      flash[:danger] = "Boyle bir yazar yok!"
      respond_with(:admin, @writer)
    end
  end
end
