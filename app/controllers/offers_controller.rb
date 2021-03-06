class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :new

  def index
    @offers = policy_scope(Offer)
    @services = Service.all
    case params[:commit]
    when "Trouver mon prestataire"
      @textOffer = "Offres disponibles"
      if params[:query] == ""
        @offers = Offer.all
      else
        @offers = @offers.where(service_id: params[:query])
      end
    when "My offers"
      @textOffer = "Mes Offres"
      @offers = @offers.where(user_id: current_user)
      @transactions = Transaction.where(offer_id: @offers)
    end
  end

  def show
    @offer = Offer.find(params[:id])
    if params[:date]
      @date = Date.parse(params[:date])
    end
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
      create_offer
    else
      redirect_to new_user_registration_path, notice: 'You are not logged in.'
    end
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    authorize @offer
    if @offer.update_attributes(offer_params)
      flash[:success] = "Object was successfully updated"
      redirect_to @offer
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    if @offer.destroy
      flash[:success] = 'Object was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to offers_path
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
