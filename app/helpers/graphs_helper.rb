# frozen_string_literal: true

module GraphsHelper
  def graph_select_options
    graph_ids = @bookmark&.graph_ids
    Graph.where
         .not(id: graph_ids)
         .pluck(:name, :id)
         .uniq
  end

  def graph_properties
    MeasuringPoint.pluck(:property).uniq
  end
end
