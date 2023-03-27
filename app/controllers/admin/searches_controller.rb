class Admin::SearchesController < ApplicationController

   before_action :authenticate_admin!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
       render "admin/searches/search"
    else
      @airguns = Airgun.looks(params[:search], params[:word])
       render "admin/searches/search"
    end
  end


end
