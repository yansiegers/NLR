# frozen_string_literal: true

class GraphsController < ApplicationController
  def index
    @graphs = Graph.all
  end
end
