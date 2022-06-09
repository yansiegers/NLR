# frozen_string_literal: true

class CreateGraphCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :graph_categories do |t|
      t.string :name

      t.timestamps
    end

    add_reference :graphs, :graph_category, foreign_key: true

    # add_reference :graphs, :graph_category, index: true
    # add_foreign_key :graphs, :graph_categories

    # add_reference :uploads, :user, index: true
    # add_foreign_key :uploads, :users
  end
end
