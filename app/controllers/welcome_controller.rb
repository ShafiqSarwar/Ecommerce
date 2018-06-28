class WelcomeController < ApplicationController
  def index
  	 @listings = Listing.all.order("created_at DESC").paginate(:page => params[:page])
     end
end
