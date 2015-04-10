class Api::V1::ReviewsController < ApplicationController
   respond_to :json

            def index
              @reviews = Review.all
              respond_with(@reviews)

            end
            def show
                @review = Review.find(params[:id])
                respond_with (@review)
            end

            def create
                @review = Review.new(user_params)
                if @review.save
                    respond_with @review
                else
                end
              end
               
            

            private

                def user_params
                    params.require(:review).permit(:user_id,:restaurant, :title, :date)

                end
            end