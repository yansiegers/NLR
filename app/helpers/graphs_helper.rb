module GraphsHelper
  def graph_properties
    MeasuringPoint.pluck(:property).uniq
  end
end
