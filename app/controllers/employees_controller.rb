class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update]
  before_action :authenticate_user! 
  #only authenticated user (created by devise engine) can access the methods below
  before_action :ensure_admin, only: [:destroy]
  #only admin user can delete, the is found in the application_helper.rb
  
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
    
    respond_to do |format|
      format.html
      format.csv { render text: @employees.to_csv }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.user_id = current_user.id
    @employee.email = current_user.email
  end

  # GET /employees/1/edit
  def edit
    
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    @employee.id = current_user.id

    edit
    
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    #this was to catch a problem gracefully but has been fixed
#    if @employee.nil?
#      respond_to do |format|
#        format.html { redirect_to employees_url, notice: 'Employee was not destroyed.' }
#        format.json { render json: @employee.errors, status: :unprocessable_entity }
#      end
#    else
    
      Employee.find(params[:id]).destroy
      respond_to do |format|
        format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
        format.json { head :no_content }
      end
#    end
  end
  
  def import
    #flash.clear
    respond_to do |format|
      begin 
        Employee.import(params[:file])
        #redirect_to employees_path, flash[:notice] = "Employees added successully"
        format.html { redirect_to employees_url, notice: 'Employees added successfully.' }
        format.json { head :no_content }
      rescue
        #redirect_to employees_path, flash[:danger] = "Invalid import, check your CSV file."
        format.html { redirect_to employees_url, notice: 'Invalid import, check your CSV file.' }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end  
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:firstname, :lastname, :add1, :add2, :add3, :role, :status, :admin, :email, :user_id)
    end
end
