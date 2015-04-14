class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  

  respond_to :html

  def index
    @reviews = Review.all.paginate(page: params[:page], per_page: 5)

    
    @hash = Gmaps4rails.build_markers(@reviews) do |review, marker|
      marker.lat review.restaurant.latitude
      marker.lng review.restaurant.longitude
      marker.infowindow review.title + " - " + review.restaurant.name
      @user = User.find(review.user_id)
end
  end

  def show
    @review = Review.find(params[:id])
    @user = User.find(@review.user_id)
    respond_with(@review)
  end

  def new
    @review = Review.new
    @restaurants = Restaurant.all
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    
    if @review.save
      flash[:notice] = 'Review was successfully created.' 
    respond_with(@review)
    else 
          flash.now[:error] = 'Please Complete the form'
          render 'new'
        end
  end

  def update
    flash[:notice] = 'Review was successfully updated.' if @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    respond_with(@review)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:user_id,:restaurant_id,:comeback, :details,:title, :date)
    end
end
