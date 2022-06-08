# frozen_string_literal: true

class CreateRolesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :roles_users, id: false do |t|
      t.belongs_to :role
      t.belongs_to :user
    end

    User.create(full_name: 'User Test', email: 'admin@nlr.com', password: 'testen', password_confirmation: 'testen') # TODO: should be moved to the user migration
    User.first.roles << Role.first
  end
end