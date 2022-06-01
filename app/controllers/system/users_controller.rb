# frozen_string_literal: true

class System::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User successfully created'
      redirect_to system_users_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:full_name, :email_address, :password)
  end
end
