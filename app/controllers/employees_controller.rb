class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :edit, :update, :destroy]

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
    #@user = User.find(params[:user])
    #@employee.user_id = current_user.id
    
  end

  # GET /employees/1/edit
  def edit
    
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
  
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
      #if @employee = current_user.employee.update(employee_params)
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
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      #@employee = current_user.employee.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:firstname, :lastname, :add1, :add2, :add3, :role, :status, :admin, :user_id)
    end
end
