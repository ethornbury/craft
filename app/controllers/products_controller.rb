class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #, except: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, only: [:edit, :update, :destroy]
  
  # GET /products
  # GET /products.json
  def index
    if params[:search]
      @products = Product.search(params[:search]).order("productname ASC")
    else
      @products = Product.all.order("productname ASC")
      #if no search then all displayed in alphabetical order
    end
    
    respond_to do |format|
      format.html
      format.csv { render text: @products.to_csv }
    end
    #@products = Product.all  #original created with scaffold
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
    respond_to do |format|
      begin 
        Product.import(params[:file])
        format.html { redirect_to products_url, notice: 'Products added successfully.' }
        format.json { head :no_content }
      rescue
        format.html { redirect_to products_url, notice: 'Invalid import, check your CSV file.' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end  
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:productname, :desc)
    end
end
