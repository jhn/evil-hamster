require 'test_helper'

class SpaceShipsControllerTest < ActionController::TestCase
  setup do
    @spaceship = spaceships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spaceships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spaceship" do
    assert_difference('Spaceship.count') do
      post :create, spaceship: { name: @spaceship.name }
    end

    assert_redirected_to spaceship_path(assigns(:spaceship))
  end

  test "should show spaceship" do
    get :show, id: @spaceship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spaceship
    assert_response :success
  end

  test "should update spaceship" do
    patch :update, id: @spaceship, spaceship: { name: @spaceship.name }
    assert_redirected_to spaceship_path(assigns(:spaceship))
  end

  test "should destroy spaceship" do
    assert_difference('Spaceship.count', -1) do
      delete :destroy, id: @spaceship
    end

    assert_redirected_to spaceships_path
  end
end
