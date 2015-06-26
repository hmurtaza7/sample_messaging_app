class AdsController < ApplicationController
  before_action :set_ad, only: [:show]

  # GET /ads
  # GET /ads.json
  def index
    @my_ads = current_user.ads
    @ads    = Ad.all
  end

  # GET /ads/1
  # GET /ads/1.json  
  def show
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
