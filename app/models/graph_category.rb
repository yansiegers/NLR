# frozen_string_literal: true

class GraphCategory < ApplicationRecord
  has_many :graphs

  validates :name, presence: true

  accepts_nested_attributes_for :graphs
end
