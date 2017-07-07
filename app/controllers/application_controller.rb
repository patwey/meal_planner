class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include Pundit

  before_action :authenticate_user
  after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def authenticate_user
    redirect_to sign_in_path, notice: 'Please sign in' unless signed_in?
  end

  def user_not_authorized
    flash[:alert] = "Oops, you're not authorized to do that"
    redirect_to(request.referrer || root_path)
  end
end
