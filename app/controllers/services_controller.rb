class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
    @offers = Offer.where(service_id: params[:id])
  end
end
