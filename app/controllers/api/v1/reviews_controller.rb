class Api::V1::ReviewsController < ApplicationController
            respond_to :json
            before_action :authenticate_user!

            def index
              @reviews = Review.all
              respond_with(@reviews)

            end
            def show
                @review = Review.find(params[:id])
                respond_with (@review)
            end
            def destroy

                @review = Review.find(params[:id])
                @review.destroy
                render json:{ message: 'Review Deleted' }
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