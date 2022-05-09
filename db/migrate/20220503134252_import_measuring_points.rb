# frozen_string_literal: true

class ImportMeasuringPoints < ActiveRecord::Migration[7.0]
  def up
    require 'csv'

    csv_text = File.read('processed_data.csv')
    csv = CSV.parse(csv_text, headers: true)
    property_columns = csv.headers.count - 1
    csv.each do |row|
      timestamp = row[0]
      for i in 1..property_columns do
        MeasuringPoint.create(
          property: csv.headers[i],
          value: row[i],
          timestamp:
        )
      end
    end
  end

  def down
    MeasuringPoint.destroy_all
  end
end
