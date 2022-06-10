# frozen_string_literal: true

class Graph < ApplicationRecord
  has_and_belongs_to_many :workspaces
  belongs_to :graph_category, inverse_of: :graphs, optional: true

  validates :name, :property, presence: true

  def data
    MeasuringPoint.where(property:)
                  .pluck(:timestamp, :value)
  end
end
