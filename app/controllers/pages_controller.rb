# frozen_string_literal: true

# Controls loose pages such as home and contact
class PagesController < EngineersDashboardController
  def home
    @properties = MeasuringPoint.pluck(:property).uniq

    if params[:filter]
      @measuring_points = MeasuringPoint.where(property: params[:filter])
      @data = @measuring_points.pluck(:timestamp, :value)
                              #  .map { |x, y| [x, y == 0 ? nil : y] }
    else
      @measuring_points =
        MeasuringPoint.pluck(:timestamp, :value)
                      .group_by(&:shift)
                      .transform_values(&:flatten)
      @data = []
    end
  end
end
