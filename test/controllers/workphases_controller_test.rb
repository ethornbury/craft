require 'test_helper'

class WorkphasesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    sign_in users(:one)
    @workphase = workphases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workphases)
    assert_select "title", "Workphase List | CraftWork"
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workphase" do
    assert_difference('Workphase.count') do
      post :create, workphase: { dateChanged: @workphase.dateChanged, employee_id: @workphase.employee_id, phase_id: @workphase.phase_id, product_id: @workphase.product_id, totalToMake: @workphase.totalToMake, totalMade: @workphase.totalMade, worknote: @workphase.worknote }
    end

    assert_redirected_to workphase_path(assigns(:workphase))
  end

  test "should show workphase" do
    get :show, id: @workphase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workphase
    assert_response :success
  end

  test "should update workphase" do
    patch :update, id: @workphase, workphase: { dateChanged: @workphase.dateChanged, employee_id: @workphase.employee_id, phase_id: @workphase.phase_id, product_id: @workphase.product_id, totalToMake: @workphase.totalToMake, totalMade: @workphase.totalMade, worknote: @workphase.worknote }
    assert_redirected_to workphase_path(assigns(:workphase))
  end

  test "should destroy workphase" do
    assert_difference('Workphase.count', -1) do
      delete :destroy, id: @workphase
    end

    assert_redirected_to workphases_path
  end
end
