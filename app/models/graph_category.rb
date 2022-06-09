# frozen_string_literal: true

class GraphCategory < ApplicationRecord
  has_many :graphs, inverse_of: :graph_category

  validates :name, presence: true

  accepts_nested_attributes_for :graphs
end
