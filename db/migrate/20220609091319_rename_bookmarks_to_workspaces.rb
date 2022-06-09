# frozen_string_literal: true

class RenameBookmarksToWorkspaces < ActiveRecord::Migration[7.0]
  def change
    rename_table :bookmarks, :workspaces
    rename_table :bookmarks_graphs, :graphs_workspaces
    rename_column :graphs_workspaces, :bookmark_id, :workspace_id
  end
end
