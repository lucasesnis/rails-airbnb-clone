class UsersController < ApplicationController
<<<<<<< HEAD
=======

  def index
    @users = User.all
  end
>>>>>>> 4b21342f49752e0d057373046f5bb29d2457c1d0
  def show
    @user = User.find(params[:id])
  end
end
