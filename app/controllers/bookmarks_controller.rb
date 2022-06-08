# frozen_string_literal: true

class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
end
