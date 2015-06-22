require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    sign_in users(:one)
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
    assert_select "title", "Employee List | CraftWork"
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { add1:"the house", add2: "the street", add3: "the city", admin: false, firstname: "John", lastname: "Doe", user_id: 3 }
    end
    assert_redirected_to employee_path(assigns(:employee))
    assert_select "title", "New Employee | CraftWork"
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
    assert_select "title", "Show Employee | CraftWork"
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
    assert_select "title", "Edit Employee | CraftWork"
  end

  test "should update employee" do
    patch :update, id: @employee, employee: { add1:"the house", add2: "the street", add3: "the city", admin: false, firstname: "John", lastname: "Doe", role: "thrower", status: "staff" }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end
    assert_redirected_to employees_path
  end
end
