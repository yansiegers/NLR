# frozen_string_literal: true

class CreateGraphs < ActiveRecord::Migration[7.0]
  def change
    create_table :graphs do |t|
      t.string :name
      t.string :property

      t.timestamps
    end
  end
end
