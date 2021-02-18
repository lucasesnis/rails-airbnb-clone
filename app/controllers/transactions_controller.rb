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
      @transaction.statut = "pending"
      @transaction.transaction_price = @transaction.boat_size.to_i * @offer.price.to_i
      create_transaction
    else
      redirect_to offers_path, notice: 'You are not logged in.'
    end
  end

  def edit
    raise
  end

  def update
    @transaction = Transaction.find(params[:id])
    authorize @transaction
    case params[:commit]
    when "Annuler"
      @transaction.statut = "Cancelled"
    when "Refuser"
      @transaction.statut = "Refused"
    when "Accepter"
      @transaction.statut = "Confirmed"
    end
    update_transaction
  end

  private

  def transaction_params
    params.require(:transaction).permit(:boat_size, :transaction_price, :date)
  end

  def create_transaction
    if @transaction.save!
      flash[:success] = "Transaction successfully created"
      redirect_to transactions_path
    else
      flash[:error] = "Something went wrong"
      redirect_to offers_path
    end
  end

  def update_transaction
    if @transaction.update_attributes(statut: @transaction.statut)
      flash[:success] = "Object was successfully updated"
      redirect_to transactions_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end
end
