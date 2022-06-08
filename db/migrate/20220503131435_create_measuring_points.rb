class CreateMeasuringPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :measuring_points do |t|
      t.string :property
      t.integer :timestamp
      t.decimal :value, precision: 15, scale: 10

      t.timestamps
    end
  end
end
