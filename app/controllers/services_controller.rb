class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @services = policy_scope(Service)
    if params[:query]
      @offers = @offers.where(service_id: params[:query])
    end
  end

  def show
    @service = Service.find(params[:id])
    authorize @service
    @offers = Offer.where(service_id: params[:id])
  end
end
