module Admin
  class ApplicationController < ::ApplicationController
    before_action :require_admin_login

    private

    def require_admin_login
      unless session[:user_id].present?
        redirect_to admin_login_path, alert: 'Please log in.'
      end
    end
  end
end
