class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  skip_before_action :authenticate_user!, only: :index

  def index

    # @offers = Offer.all
    # if params[:query]
    #   @offers = @offers.where(service_id: params[:query])
    # end

    @offers = policy_scope(Offer)

    if params[:query]
      @offers = @offers.where(service_id: params[:query])
    end

  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if current_user
      @offer.user = current_user
      if @offer.save!
        flash[:success] = "Offer successfully created"
        redirect_to offer_path(@offer)
      else
        flash[:error] = "You are not connected !"
        redirect_to new_user_registration_path
      end
    else
      redirect_to new_user_registration_path, notice: 'You are not logged in.'
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :service_id)
  end
end
