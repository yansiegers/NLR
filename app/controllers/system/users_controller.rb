# frozen_string_literal: true

class System::UsersController < ApplicationController
  before_action :find_user, only: %i[edit update destroy]

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

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'User was successfully updated'
      redirect_to system_users_path
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = 'User was successfully deleted'
      redirect_to system_users_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to system_users_path
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:full_name, :email_address, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
