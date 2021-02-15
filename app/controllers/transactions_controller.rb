class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @user = User.find(params[:user_id])
    @offer = Offer.find(params[:offer_id])
    if current_user
      @transaction.user = current_user
      if @transaction.save!
        flash[:success] = "Transaction successfully created"
        redirect_to offer_path(@offer)
      else
        flash[:error] = "Something went wrong"
        redirect_to offers_path
      end
    else
      redirect_to offers_path, notice: 'You are not logged in.'
    end
  end

  def edit
  end

  def update
  end
end
