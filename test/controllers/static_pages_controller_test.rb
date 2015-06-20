require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    sign_in users(:one)
    @employee = employees(:one)
  end
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | CraftWork"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | CraftWork"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | CraftWork"
  end
  test "should get manager" do
    get :manager
    assert_response :success
    assert_select "title", "Admin | CraftWork"
  end
  
  test "download_pdf" do
    assert_response :success
  end
  
  test "show_pdf" do
    assert_response :success
  end
end