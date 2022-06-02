# frozen_string_literal: true

class GraphBookmark < ApplicationRecord
  belongs_to :graph
  belongs_to :bookmark

  validates :graph_id, uniqueness: { scope: :bookmark_id }
end
