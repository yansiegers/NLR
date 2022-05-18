# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :user
  has_many :graph_bookmarks
  has_many :graphs, through: :graph_bookmarks
end
