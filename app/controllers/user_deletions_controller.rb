# frozen_string_literal: true

class UserDeletionsController < ApplicationController
  skip_after_action :verify_authorized, only: %i[new create]

  def new
    @user = User.find(params[:id])
    policy(@user).destroy?
  end

  def create
    @user = User.find(params[:id])
    policy(@user).destroy?

    redirect_to destroy_user_path(@user)
  end
end
