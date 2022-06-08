# frozen_string_literal: true

class GraphBookmark < ApplicationRecord
  belongs_to :graph
  belongs_to :bookmark
end
