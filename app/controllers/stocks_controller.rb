class StocksController < ApplicationController
  before_action :set_stock, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @stocks = Stock.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @stock = Stock.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @stock = Stock.new(stock_params)
    Product.all.each do |product|
      @stock.products << product
    end
    respond_to do |format|
      if @stock.save
        format.html { redirect_to stock_url(@stock), notice: "Stock was successfully created." }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @stock.update(product_params)
        format.html { redirect_to product_url(@stock), notice: "Stock was successfully updated." }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @stock.products.destroy_all
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_stock
    @stock = Stock.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def stock_params
    params.require(:stock).permit(:title)
  end
end
