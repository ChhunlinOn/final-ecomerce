module Admin
  class RootController < ::ApplicationController
    def index
      if session[:user_id].present?
        redirect_to admin_dashboard_path
      else
        redirect_to admin_login_path
      end
    end
  end
end
