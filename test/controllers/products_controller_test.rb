require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    sign_in users(:one)
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    assert_select "title", "Product List | CraftWork"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "New Product | CraftWork"
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { desc: "product one description", productname: "product one" }
    end
    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
    assert_select "title", "Show Product | CraftWork"
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
    assert_select "title", "Edit Product | CraftWork"
  end

  test "should update product" do
    patch :update, id: @product, product: { desc: "product one description", productname: "product one" }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
