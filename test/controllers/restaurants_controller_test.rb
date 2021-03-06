require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { address: @restaurant.address, food: @restaurant.food, latitude: @restaurant.latitude, longitude: @restaurant.longitude, name: @restaurant.name }
    end

    assert_response 201
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    put :update, id: @restaurant, restaurant: { address: @restaurant.address, food: @restaurant.food, latitude: @restaurant.latitude, longitude: @restaurant.longitude, name: @restaurant.name }
    assert_response 204
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_response 204
  end
end
