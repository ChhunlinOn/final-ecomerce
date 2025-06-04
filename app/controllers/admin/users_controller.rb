class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin!
  layout 'admin'

  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def ensure_admin!
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end
end