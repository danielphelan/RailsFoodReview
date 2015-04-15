class VisitorsController < ApplicationController
  def index
    if user_signed_in?
      @reviews = Review.all.paginate(page: params[:page], per_page: 5)
      @hash = Gmaps4rails.build_markers(@reviews) do |review, marker|
      marker.lat review.restaurant.latitude
      marker.lng review.restaurant.longitude
      marker.infowindow review.title + " - " + review.restaurant.name
      @user = User.find(review.user_id)
      end
      render 'reviews/index'

    end
  end
end
