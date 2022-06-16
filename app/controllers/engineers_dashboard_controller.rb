# frozen_string_literal: true

class EngineersDashboardController < ApplicationController
  before_action :authenticate_user!, :gather_bookmarks

  layout 'engineers_dashboard'

  private

  def gather_bookmarks
    bookmarks = if current_user
                  current_user.bookmarks.limit(4)
                else
                  Bookmark.all
                end

    @quick_bookmarks = bookmarks.limit(4)
  end
end
