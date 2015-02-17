class AdminsController < ApplicationController

  def new
    @admin = Admin.find(params[:id])
  end


  private
    def admin_params
      params.require(:admin).permit(:email)
    end
end
