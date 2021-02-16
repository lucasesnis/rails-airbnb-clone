class ServicesController < ApplicationController
  def index
    @services = policy_scope(Service)
  end

  def show
    @service = Service.find(params[:id])
    authorize @service
    # @offers = Offer.where(service_id: params[:id])
  end
end
