class OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(params[:Offer])
    if @offer.save
      flash[:success] = "Offer successfully created"
      redirect_to @offer
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price, :user)
  end
end
