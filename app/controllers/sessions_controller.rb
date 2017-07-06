class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new; end

  def create
    @user = User.find_by_email(user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      sign_in @user
      flash[:notice] = 'Welcome back!'
      redirect_to @user
    else
      flash.now[:alert] = 'Invalid credentials. Please try again.'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_path, notice: 'Signed out successfully'
  end

  private

  def user_params
    params.require(:user).permit([:email, :password])
  end
end
