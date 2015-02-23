class AdminsController < Admin::BaseController

  def new
    @admin = Admin.find(params[:id])
  end

  def self.edit
    @admin = Admin.find(params[:id])
  end

  private
    def admin_params
      params.require(:admin).permit(:email)
    end
end
