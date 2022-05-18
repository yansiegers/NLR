# frozen_string_literal: true

class System::UsersController < ApplicationController
  def index
    @users = User.all
  end
end
