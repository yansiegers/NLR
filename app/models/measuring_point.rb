# frozen_string_literal: true

class MeasuringPoint < ApplicationRecord
  validates :property, :timestamp, :value, presence: true
end
