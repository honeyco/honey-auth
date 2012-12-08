class AccountsController < ApplicationController
  before_filter :signed_in?, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      redirect_to signed_in_path(:created)
    else
      render 'accounts/new'
    end
  end

  def update
    params[:user].delete(:password) unless params[:user][:password].present?
    @user = current_user
    @user.attributes = params[:user]

    if @user.save
      redirect_to updated_account_path
    else
      render 'accounts/edit'
    end
  end

  def edit
    @user = current_user
  end
end
