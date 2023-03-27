class Admin::AirgunsController < ApplicationController

  def index
    @airguns = Airgun.all
  end

  def show
    @airgun = Airgun.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @airgun = Airgun.find(params[:id])
  end

  def update
    @airgun = Airgun.find(params[:id])
    if @airgun.update(airgun_params)
      flash[:notice] = "You have updated airgun successfully."
      redirect_to admin_airgun_path(@airgun)
    else
      render :edit
    end
  end

  def destroy
    @airgun = Airgun.find(params[:id])
    @airgun.destroy
    redirect_to admin_airguns_path, notice: "削除が完了しました。"
  end

   private

   def airgun_params
    params.require(:airgun).permit(:gun_name, :gun_caption)
   end
end
