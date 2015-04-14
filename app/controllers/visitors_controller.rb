class VisitorsController < ApplicationController
  def index
    if user_signed_in?
      @reviews = Review.all.paginate(page: params[:page], per_page: 5)
      render 'reviews/index'
    end
  end
end
