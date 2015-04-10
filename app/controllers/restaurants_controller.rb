class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @restaurants = Restaurant.all
    @hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
      marker.infowindow restaurant.name
    end
    respond_with(@restaurants)
  end

  def show
     @restaurant = Restaurant.find(params[:id])
     @reviews = @restaurant.reviews
    # respond_with(@restaurant)
    @hash = Gmaps4rails.build_markers(@restaurant) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
      marker.infowindow restaurant.name
    end
  end

  def new
    @restaurant = Restaurant.new
    respond_with(@restaurant)
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    flash[:notice] = 'Restaurant was successfully created.' if @restaurant.save
    respond_with(@restaurant)
  end

  def update
    flash[:notice] = 'Restaurant was successfully updated.' if @restaurant.update(restaurant_params)
    respond_with(@restaurant)
  end

  def destroy
    @restaurant.destroy
    respond_with(@restaurant)
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :food, :address, :latitude, :longitude)
    end
end
