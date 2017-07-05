class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :authenticate_user

  private

  def authenticate_user
    redirect_to sign_in_path, notice: 'Please sign in' unless signed_in?
  end
end
