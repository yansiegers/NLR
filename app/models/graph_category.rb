# frozen_string_literal: true

class GraphCategory < ApplicationRecord
  has_many :graphs, inverse_of: :graph_category
  has_many :workspaces, through: :graphs, inverse_of: :graph_categories

  validates :name, presence: true

  accepts_nested_attributes_for :graphs
end
