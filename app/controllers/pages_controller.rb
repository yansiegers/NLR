# frozen_string_literal: true

# Controls loose pages such as home and contact
class PagesController < ApplicationController
  def home
    @properties = MeasuringPoint.pluck(:property).uniq
    @measuring_points = MeasuringPoint.where(property: params[:filter])
    @data = @measuring_points.pluck(:timestamp, :value)
  end
end
