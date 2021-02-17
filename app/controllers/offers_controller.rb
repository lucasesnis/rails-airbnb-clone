class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :new

  def index
    @offers = policy_scope(Offer)
    if params[:commit] == "Trouver mon prestataire"
      @offers = @offers.where(service_id: params[:query])
    elsif params[:commit] == "My Offers"
      @offers = @offers.where(user_id: current_user)
    end
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
    @transaction = Transaction.new
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    authorize @offer
    if current_user
      @offer.user = current_user
    else
      redirect_to new_user_registration_path, notice: 'You are not logged in.'
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :service_id)
  end

  def create_offer
    if @offer.save!
      flash[:success] = "Offer successfully created"
      redirect_to offer_path(@offer)
    else
      flash[:error] = "You are not connected !"
      redirect_to new_user_registration_path
    end
  end
end
