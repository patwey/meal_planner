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
    redirect_back fallback_location: root_path,
                  alert: "Oops, you're not authorized to do that"
  end
end
