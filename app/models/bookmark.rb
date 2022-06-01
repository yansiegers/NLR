# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :user
  has_many :graph_bookmarks
  has_many :graphs, through: :graph_bookmarks

  validates :name, :user, presence: true
  validates :favorite, inclusion: { in: [true, false] }
end
