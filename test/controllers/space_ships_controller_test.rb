require 'test_helper'

class SpaceShipsControllerTest < ActionController::TestCase
  setup do
    @space_ship = space_ships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:space_ships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create space_ship" do
    assert_difference('SpaceShip.count') do
      post :create, space_ship: { name: @space_ship.name }
    end

    assert_redirected_to space_ship_path(assigns(:space_ship))
  end

  test "should show space_ship" do
    get :show, id: @space_ship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @space_ship
    assert_response :success
  end

  test "should update space_ship" do
    patch :update, id: @space_ship, space_ship: { name: @space_ship.name }
    assert_redirected_to space_ship_path(assigns(:space_ship))
  end

  test "should destroy space_ship" do
    assert_difference('SpaceShip.count', -1) do
      delete :destroy, id: @space_ship
    end

    assert_redirected_to space_ships_path
  end
end
