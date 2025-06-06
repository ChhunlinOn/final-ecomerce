module Admin
  class SessionsController < ::ApplicationController
    def new
      # Just render login form
    end

    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to admin_dashboard_path, notice: 'Logged in successfully.'
      else
        flash.now[:alert] = 'Invalid email or password.'
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to admin_login_path, notice: 'Logged out successfully.'
    end
  end
end
