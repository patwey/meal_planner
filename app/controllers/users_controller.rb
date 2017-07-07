class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  before_action :verify_guest, only: [:new]

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
      flash[:error] = 'There was a problem creating your account'
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'Your profile has been updated'
    else
      flash[:error] = 'There was a problem updating your profile'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    sign_out

    redirect_to sign_up_path,
                notice: 'Your account has been successfully deleted'
  end

  private

  def user_params
    params.require(:user).permit([:name, :email, :password])
  end
end
