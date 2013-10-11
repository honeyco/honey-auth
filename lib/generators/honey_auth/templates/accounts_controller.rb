class AccountsController < ApplicationController
  before_filter :signed_in!, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_to signed_in_path(:created)
    else
      render 'accounts/new'
    end
  end

  def update
    user_params.delete(:password) unless user_params[:password].present?
    @user = current_user
    @user.attributes = user_params

    if @user.save
      redirect_to root_path
    else
      render 'accounts/edit'
    end
  end

  def edit
    @user = current_user
  end

protected

  def user_params
    params.require(:user).permit(:classcode, :email, :name, :username, :password, :password_confirmation)
  end
end
