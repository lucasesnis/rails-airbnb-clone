class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
    authorize @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)
    authorize @transaction
    if current_user
      @transaction.user = current_user
      @transaction.offer = Offer.find(params[:offer_id])
      create_transaction
    else
      redirect_to offers_path, notice: 'You are not logged in.'
    end
  end

  def edit
  end

  def update
  end

  private

  def transaction_params
    params.require(:transaction).permit(:boat_size, :transaction_price, :date)
  end

  def create_transaction
    if @transaction.save!
      flash[:success] = "Transaction successfully created"
      redirect_to offer_path(@offer)
    else
      flash[:error] = "Something went wrong"
      redirect_to offers_path
    end
  end
end
