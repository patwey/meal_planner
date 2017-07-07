class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user

    if @user.save
      sign_in @user
      redirect_to @user, notice: 'Welcome to Rhubarb!'
    else
      render 'new', error: 'There was a problem creating your account'
    end
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'Your profile has been updated'
    else
      render :edit, error: 'There was a problem updating your profile'
    end
  end

  private

  def user_params
    params.require(:user).permit([:name, :email, :password])
  end
end
