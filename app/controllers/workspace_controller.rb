# frozen_string_literal: true

class WorkspaceController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks
  end
end
