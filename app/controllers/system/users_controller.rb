# frozen_string_literal: true

module System
  class UsersController < ::EngineersDashboardController
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end
  end
end
