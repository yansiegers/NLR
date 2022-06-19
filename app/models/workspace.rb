# frozen_string_literal: true

class Workspace < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :graphs
  has_many :graph_categories, through: :graphs, inverse_of: :workspaces

  validates :name, :user, presence: true
  validates :favorite, inclusion: { in: [true, false] }

  accepts_nested_attributes_for :graphs
end
