class WorkphasesController < ApplicationController
  before_action :set_workphase, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  before_action :ensure_admin, only: [:edit, :update, :destroy]
  delegate :fullname, to: :employee, prefix: true #facillitates => @workphase.employee_fullname
  delegate :lastname,     to: :employee, prefix: true
  delegate :phasename,    to: :phase,    prefix: true
  delegate :productname,  to: :product,  prefix: true
  # GET /workphases
  # GET /workphases.json
  def view
  end
  
  def index
    @workphases = Workphase.all
  end

  # GET /workphases/1
  # GET /workphases/1.json
  def show
  end

  # GET /workphases/new
  def new
    @workphase = Workphase.new
  end

  # GET /workphases/1/edit
  def edit
  end

  # POST /workphases
  # POST /workphases.json
  def create
    @workphase = Workphase.new(workphase_params)

    respond_to do |format|
      if @workphase.save
        format.html { redirect_to @workphase, notice: 'Workphase was successfully created.' }
        format.json { render :show, status: :created, location: @workphase }
      else
        format.html { render :new }
        format.json { render json: @workphase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workphases/1
  # PATCH/PUT /workphases/1.json
  def update
    respond_to do |format|
      if @workphase.update(workphase_params)
        format.html { redirect_to @workphase, notice: 'Workphase was successfully updated.' }
        format.json { render :show, status: :ok, location: @workphase }
      else
        format.html { render :edit }
        format.json { render json: @workphase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workphases/1
  # DELETE /workphases/1.json
  def destroy
    @workphase.destroy
    respond_to do |format|
      format.html { redirect_to workphases_url, notice: 'Workphase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workphase
      @workphase = Workphase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workphase_params
      params.require(:workphase).permit(:worknote, :total, :dateChanged, :product_id, :phase_id, :employee_id)
    end
end
