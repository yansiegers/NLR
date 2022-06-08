# frozen_string_literal: true

class CreateBookmarksGraphs < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks_graphs do |t|
      t.belongs_to :bookmark
      t.belongs_to :graph

      t.timestamps
    end
  end
end
