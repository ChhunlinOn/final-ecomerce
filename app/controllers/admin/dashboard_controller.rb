class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!
  layout 'admin'  # This tells Rails to use the admin layout instead of application layout

  def index
    # Dashboard stats and data
    @users_count = User.count
    @products_count = Product.count rescue 0
    @category_count = Category.count rescue 0
    @orders_count = Order.where(order_status: 'paid').count rescue 0
    @recent_users = User.limit(5).order(created_at: :desc)
  end

  private

  def ensure_admin!
    redirect_to admin_login_path, alert: 'Access denied.' unless current_user.admin?
  end
end

