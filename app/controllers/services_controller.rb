class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @services = policy_scope(Service)
  end

  def show
    @service = Service.find(params[:id])
    @services = Service.all
    authorize @service
    @offers = Offer.where(service_id: params[:id])
  end
end
