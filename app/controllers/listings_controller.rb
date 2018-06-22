class ListingsController < ApplicationController
  before_action :set_listing, only: [:update, :edit, :destroy]

  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new]

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all.order("created_at DESC")
    # redirect_to root_path
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])
  end

  # GET /listings/new
  def new

    @listing = current_user.listings.build
    @user = current_user 
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.build(listing_params)
    @user =current_user

    respond_to do |format|
      if @listing.save
        format.html { redirect_to root_path, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    @listing = Listing.find(params[:id])
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to root_path, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      if(user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :description, :adress, :cover, :_destroy)
    end
end
