class UsersController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> b924485845a884c5affd97683d8514e59f0204d5

  def index
    @users = User.all
  end
<<<<<<< HEAD
>>>>>>> 4b21342f49752e0d057373046f5bb29d2457c1d0
=======
>>>>>>> b924485845a884c5affd97683d8514e59f0204d5
  def show
    @user = User.find(params[:id])
  end
end
