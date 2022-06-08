# frozen_string_literal: true

class Graph < ApplicationRecord
  has_and_belongs_to_many :bookmarks

  validates :name, :property, presence: true

  def data
    MeasuringPoint.where(property:)
                  .pluck(:timestamp, :value)
  end
end
