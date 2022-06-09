# frozen_string_literal: true

class CreateGraphCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :graph_categories do |t|
      t.string :name

      t.timestamps
    end

    add_reference :graphs, :graph_category, index: true
  end
end
