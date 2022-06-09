# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_user, :gather_workspaces, :gather_quick_workspaces

  def current_user
    # return unless session[:user_id]
    # @current_user ||= User.find(session[:user_id])

    # TODO: Add user login system with Devise
    @current_user ||= User.first # temporary
  end

  private

  def gather_workspaces
    @workspaces = current_user.workspaces
  end

  def gather_quick_workspaces
    @quick_workspaces = current_user.workspaces.limit(4)
  end
end
