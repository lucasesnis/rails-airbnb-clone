class OffersController < ApplicationController
  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @service = Service.find(params[:service_id])
    @offer = Offer.new(offer_params)
    if current_user
      @offer.user = current_user
      if @offer.save!
        flash[:success] = "Offer successfully created"
        redirect_to service_path(@service)
      else
        flash[:error] = "You are not connected !"
        redirect_to services_path
      end
    else
      redirect_to services_path, notice: 'You are not logged in.'
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :service_id)
  end
end
