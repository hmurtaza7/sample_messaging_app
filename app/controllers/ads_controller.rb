class AdsController < ApplicationController
  before_action :set_ad, only: [:show]

  def index
    @my_ads = current_user.ads
    @ads    = Ad.all
  end

  def show
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
