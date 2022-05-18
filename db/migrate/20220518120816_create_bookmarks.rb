# frozen_string_literal: true

class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.boolean :favorite

      t.timestamps
    end
  end
end
