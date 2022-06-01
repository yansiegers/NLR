# frozen_string_literal: true

class Graph < ApplicationRecord
  has_many :graph_bookmarks
  has_many :bookmarks, through: :graph_bookmarks

  validates :name, :property, presence: true
end
