# frozen_string_literal: true

class GraphsController < ApplicationController
  before_action :find_graph, only: %i[edit update destroy]
  before_action :get_properties, only: %i[new edit]

  def index
    @graphs = Graph.all
  end

  def new
    @graph = Graph.new
  end

  def create
    @graph = Graph.new(graph_params)
    if @graph.save
      flash[:success] = 'Graph successfully created'
      redirect_to graphs_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def edit; end

  def update
    if @graph.update(graph_params)
      flash[:success] = 'Graph was successfully updated'
      redirect_to graphs_path
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    if @graph.destroy
      flash[:success] = 'Graph was successfully deleted'
      redirect_to graphs_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to graphs_path
    end
  end

  private

  def graph_params
    params.require(:graph)
          .permit(:name, :property)
  end

  def get_properties
    @properties = MeasuringPoint.pluck(:property).uniq
  end

  def find_graph
    @graph = Graph.find(params[:id])
  end
end
