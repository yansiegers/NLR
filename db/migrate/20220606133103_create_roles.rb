# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :utility_name

      t.timestamps
    end

    Role.create([
      { name: 'Admin', utility_name: 'admin' },
      { name: 'Engineer', utility_name: 'engineer' },
      { name: 'Marketer', utility_name: 'marketer' }
    ])
  end
end
