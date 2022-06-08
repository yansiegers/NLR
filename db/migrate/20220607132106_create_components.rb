class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components do |t|
      t.string :name
      t.integer :stress

      t.timestamps
    end
  end
end
