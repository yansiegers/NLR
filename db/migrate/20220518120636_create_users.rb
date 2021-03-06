# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email_address
      t.string :password

      t.timestamps
    end

    User.create(full_name: 'User Test', email_address: 'info@example.com', password: 'test')
  end
end
