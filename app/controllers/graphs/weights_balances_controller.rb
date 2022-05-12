# frozen_string_literal: true

module Graphs
  # Controls weights and balances
  class WeightsBalancesController < ApplicationController
    def index
      @measuring_points = MeasuringPoint.where(property: 'COG_dev_y')
      @data = @measuring_points.pluck(:timestamp, :value)
    end
  end
end
