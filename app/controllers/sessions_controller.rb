# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: %i[new create]
  skip_after_action :verify_authorized

  before_action :verify_guest, only: [:new]

  def new; end

  def create
    @user = User.find_by_email(session_params[:email])
    if @user&.authenticate(session_params[:password])
      sign_in @user
      redirect_to @user, notice: "Welcome back #{@user.name}!"
    else
      flash[:error] = 'Invalid credentials. Please try again.'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_path, notice: "You've been successfully signed out"
  end

  private

  def session_params
    params.require(:user).permit(%i[email password])
  end
end
