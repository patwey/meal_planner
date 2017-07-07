class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  skip_after_action :verify_authorized

  def new; end

  def create
    @user = User.find_by_email(session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      sign_in @user
      redirect_back fallback_location: @user, notice: 'Welcome back!'
    else
      render :new, error: 'Invalid credentials. Please try again.'
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_path, notice: "You've been successfully signed out"
  end

  private

  def session_params
    params.require(:user).permit([:email, :password])
  end
end
