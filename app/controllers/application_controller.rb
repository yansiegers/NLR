# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_user, :gather_bookmarks

  def current_user
    # return unless session[:user_id]
    # @current_user ||= User.find(session[:user_id])

    # TODO: Add user login system with Devise
    @current_user ||= User.first # temporary
  end

  private

  def gather_bookmarks
    @quick_bookmarks = current_user.bookmarks
  end
end
