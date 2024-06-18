class ProductStocksController < ApplicationController
  before_action :set_product_stock, only: %i[  edit update ]

  #before_filter :authenticate_user!, except => [:new, :create, :destroy, :update]
  before_action :authenticate_user!, only: %i[ edit  update ]
  load_and_authorize_resource

  def index

  end
  def edit
  end

  def update
    respond_to do |format|
      if @product_stock.update(product_stock_params)
        format.html { redirect_to stock_url(@stock), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_stock.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product_stock
    if params[:product_id].blank? && params[:stock_id].blank?
      @product_stock = ProductStock.find(params[:id])
      @stock = Stock.find(@product_stock.stock_id)
    else
      @product = Product.find(params[:product_id])
      @stock = Stock.find(params[:stock_id])
      @product_stock = ProductStock.find_by(product_id: @product.id, stock_id: @stock.id)
    end
  end

  def product_stock_params
    params.require(:product_stock).permit(:amount)
  end
end
