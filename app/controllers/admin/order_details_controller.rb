class Admin::OrderDetailsController < ApplicationController
  before_action :set_admin_order_detail, only: %i[ show edit update destroy ]
  layout "admin"

  # GET /admin/order_details or /admin/order_details.json
  def index
    @admin_order_details = OrderDetail.all
  end

  # GET /admin/order_details/1 or /admin/order_details/1.json
  def show
  end

  # GET /admin/order_details/new
  def new
    @admin_order_detail = OrderDetail.new
  end

  # GET /admin/order_details/1/edit
  def edit
  end

  # POST /admin/order_details or /admin/order_details.json
  def create
    @admin_order_detail = OrderDetail.new(admin_order_detail_params)

    respond_to do |format|
      if @admin_order_detail.save
        format.html { redirect_to @admin_order_detail, notice: "Order detail was successfully created." }
        format.json { render :show, status: :created, location: @admin_order_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/order_details/1 or /admin/order_details/1.json
  def update
    respond_to do |format|
    if @admin_order_detail.update(admin_order_detail_params)
      # Also update the order status if provided and related order exists
      if params[:order_status].present? && @admin_order_detail.orders_id.present?
        order = Order.find_by(id: @admin_order_detail.orders_id)
        order.update(order_status: params[:order_status].downcase) if order
      end

      format.html { redirect_to @admin_order_detail, notice: "Order detail was successfully updated." }
      format.json { render :show, status: :ok, location: @admin_order_detail }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @admin_order_detail.errors, status: :unprocessable_entity }
    end
    end
  end

  # DELETE /admin/order_details/1 or /admin/order_details/1.json
  def destroy
    @admin_order_detail.destroy!

    respond_to do |format|
      format.html { redirect_to admin_order_details_path, status: :see_other, notice: "Order detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_order_detail
      @admin_order_detail = OrderDetail.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def admin_order_detail_params
      params.expect(admin_order_detail: [ :order_id, :varain_detail_id, :qauntity, :price ])
    end
end
