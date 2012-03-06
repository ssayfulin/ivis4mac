require 'test_helper'

class FifasControllerTest < ActionController::TestCase
  setup do
    @fifa = fifas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fifas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fifa" do
    assert_difference('Fifa.count') do
      post :create, fifa: @fifa.attributes
    end

    assert_redirected_to fifa_path(assigns(:fifa))
  end

  test "should show fifa" do
    get :show, id: @fifa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fifa
    assert_response :success
  end

  test "should update fifa" do
    put :update, id: @fifa, fifa: @fifa.attributes
    assert_redirected_to fifa_path(assigns(:fifa))
  end

  test "should destroy fifa" do
    assert_difference('Fifa.count', -1) do
      delete :destroy, id: @fifa
    end

    assert_redirected_to fifas_path
  end
end
