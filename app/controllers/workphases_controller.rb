class WorkphasesController < ApplicationController
  before_action :set_workphase, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 
  before_action :ensure_admin, only: [:destroy]

  delegate :firstname,    to: :employee, prefix: true
  delegate :lastname,     to: :employee, prefix: true
  delegate :phasename,    to: :phase,    prefix: true
  delegate :productname,  to: :product,  prefix: true
  # the above delegate lines allow for the field from table to used
  respond_to :json, :html
  
  # GET /workphases
  # GET /workphases.json
  
  def view
    @workphases = Workphase.search_by_phase(params[:search])
  end
  def viewmain
    @workphases = Workphase.all
  end 
  
  def index
    #@workphases = Workphase.all
    if params[:search]
      @workphases = Workphase.search_by_product(params[:search])
    else
      @workphases = Workphase.all
    end
    
    respond_to do |format|
      format.html
      format.csv { render text: @workphases.to_csv }
    end
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
        format.json { respond_with_bip(@workphase) } #this is added as best_in_place update wasn't holding
        format.html { redirect_to @workphase, notice: 'Workphase was successfully updated.' }
        #format.json { render :show, status: :ok, location: @workphase }
      else
        format.html { render :edit }
        format.json { render json: @workphase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workphases/1
  # DELETE /workphases/1.json
  def destroy
    Workphase.find(params[:id]).destroy
    #@workphase.destroy
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
      params.require(:workphase).permit(:worknote, :dateChanged, 
                     :product_id, :phase_id, :employee_id,
                     :adminNote,  :totalMade, :totalToMake,
                     :dateComplete)
    end
end
