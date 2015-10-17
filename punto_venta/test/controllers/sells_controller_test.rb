require 'test_helper'

class SellsControllerTest < ActionController::TestCase
  setup do
    @sell = sells(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sells)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sell" do
    assert_difference('Sell.count') do
      post :create, sell: { cliente_id: @sell.cliente_id, total: @sell.total, user_id: @sell.user_id }
    end

    assert_redirected_to sell_path(assigns(:sell))
  end

  test "should show sell" do
    get :show, id: @sell
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sell
    assert_response :success
  end

  test "should update sell" do
    patch :update, id: @sell, sell: { cliente_id: @sell.cliente_id, total: @sell.total, user_id: @sell.user_id }
    assert_redirected_to sell_path(assigns(:sell))
  end

  test "should destroy sell" do
    assert_difference('Sell.count', -1) do
      delete :destroy, id: @sell
    end

    assert_redirected_to sells_path
  end
end
