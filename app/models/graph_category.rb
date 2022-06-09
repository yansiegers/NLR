# frozen_string_literal: true

class GraphCategory < ApplicationRecord
  belongs_to :graph

  validates :name, presence: true
end
