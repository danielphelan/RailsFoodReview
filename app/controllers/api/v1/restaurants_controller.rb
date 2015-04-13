class Api::V1::RestaurantsController < ApplicationController
   respond_to :json

            def index
              @restaurants = Restaurant.all
              respond_with(@restaurants)

            end
            def show
                @restaurant = Restaurant.find(params[:id])
                @reviews = @restaurant.reviews
                respond_with (@restaurant)
            end
            def rest_reviews
                @restaurant = Restaurant.find(params[:id])
                @reviews = @restaurant.reviews
                respond_with (@reviews)

            end
            def create
                @restaurant = Restaurant.new(rest_params)
                if @restaurant.save
                    respond_with @restaurant
                else
                end
              end
               
            

            private

                def rest_params
                    params.require(:restaurant).permit(:name,:food, :address)

                end
            end