# frozen_string_literal: true

module GraphsHelper
  def graph_select_options
    Graph.pluck(:name, :id).uniq
  end

  def graph_properties
    MeasuringPoint.pluck(:property).uniq
  end
end
