class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  #before_filter :authenticate_user!, except => [:new, :create, :destroy, :update]
  before_action :authenticate_user!, only: %i[show new create edit destroy update edit_amount]
  load_and_authorize_resource
  # GET /products or /products.json
  def index
    if params[:search].blank? and params[:stock_ids].blank?
      @products = Product.all
    elsif params[:stock_ids].present?
      @products = Product.where(id: ProductStock.where('amount != 0').where(stock_id: params[:stock_ids].map(&:to_i)).pluck(:product_id))
    else
      key = "%#{params[:search]}%"
      @products = Product.where("title LIKE ?", key)
    end
    @stocks = Stock.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end


  # POST /products or /products.json
  def create
    @product = Product.new(title: product_params['title'], body: product_params['body'], user_id: current_user.id)
    Stock.all.each do |stock|
      @product.stocks << stock
    end
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.stocks.destroy_all
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :body)
    end
end
