# frozen_string_literal: true

class WorkspaceController < EngineersDashboardController
  def index
    return Bookmark.all unless current_user

    @bookmarks = current_user.bookmarks
  end
end
