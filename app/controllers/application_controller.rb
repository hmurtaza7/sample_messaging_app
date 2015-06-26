class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # make sure user logged in before every action
  before_action :authenticate_user!

  # GET /
  # GET /home
  def home
    # load user ads
    @my_ads = current_user.ads

    # load all ads in system
    @ads    = Ad.all
  end
end
