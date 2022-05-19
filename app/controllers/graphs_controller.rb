# frozen_string_literal: true

class GraphsController < ApplicationController
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

  private

  def graph_params
    params.require(:graph)
          .permit(:name, :property)
  end
end
