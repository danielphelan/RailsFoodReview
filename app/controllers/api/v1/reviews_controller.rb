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
                @review = Review.new(review_params)
                if @review.save
                    respond_with @review
                else

                end
              end
               
            

            private

                def review_params
                    params.require(:review).permit(:user_id, :restaurant_id, :comeback,:title,:details, :date)

                end
            end