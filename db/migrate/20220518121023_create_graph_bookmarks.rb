# frozen_string_literal: true

class CreateGraphBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :graph_bookmarks do |t|
      t.references :graph, null: false, foreign_key: true
      t.references :bookmark, null: false, foreign_key: true

      t.timestamps
    end
  end
end
