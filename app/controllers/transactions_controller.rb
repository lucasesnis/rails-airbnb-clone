class TransactionsController < ApplicationController
  def index
    @transactions = policy_scope(Transaction)
    @transactions = @transactions.where(user_id: current_user)
  end

  def show
    @transaction = Transaction.find(params[:id])
    authorize @transaction
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @transaction = Transaction.new
    authorize @transaction
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @transaction = Transaction.new(transaction_params)
    authorize @transaction
    if current_user
      @transaction.user = current_user
      @transaction.offer = @offer
      @transaction.status = "pending"
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
      redirect_to offer_transaction_path(@offer, @transaction)
    else
      flash[:error] = "Something went wrong"
      redirect_to offers_path
    end
  end
end
