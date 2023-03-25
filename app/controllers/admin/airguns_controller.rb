class Admin::AirgunsController < ApplicationController

  def index
    @airguns = Airgun.all
  end

  def show
    @airgun = User.find(params[:id])
  end

  def edit
    @airgun = User.find(params[:id])
  end

  def update
    @airgun = Airgun.find(params[:id])
    if @airgun.update(user_params)
      flash[:notice] = "You have updated airgun successfully."
      redirect_to admin_airgun_path(@airgun)
    else
      render :edit
    end
  end

#   private

#   def user_params
#     params.require(:user).permit(:email, :name, :is_deleted)
#   end
end
