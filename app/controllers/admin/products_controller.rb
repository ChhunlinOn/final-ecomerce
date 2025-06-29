class Admin::ProductsController < ApplicationController
  layout 'admin'
  before_action :ensure_admin!
  before_action :set_admin_product, only: %i[show edit update destroy]

  # GET /admin/products
  def index
    @admin_products = Product.all
  end

  # GET /admin/products/1
  def show
  end

  # GET /admin/products/new
  def new
    @admin_product = Product.new
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  def create
    @admin_product = Product.new(admin_product_params)
  
    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_products_path, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /admin/products/1
  def update
    respond_to do |format|
      if @admin_product.update(admin_product_params)
        format.html { redirect_to [:admin, @admin_product], notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  def destroy
    @admin_product.destroy!

    respond_to do |format|
      format.html { redirect_to admin_products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_product
    @admin_product = Product.find(params[:id])
  end

  def admin_product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :active)
  end

  def ensure_admin!
    redirect_to admin_login_path, alert: 'Access denied.' unless current_user&.admin?
  end
end
