# frozen_string_literal: true

class CreateRolesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :roles_users, id: false do |t|
      t.belongs_to :role
      t.belongs_to :user
    end

    User.first.roles << Role.first
  end
end
