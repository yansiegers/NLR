# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @workspaces = current_user.workspaces
  end
end
