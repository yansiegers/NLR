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

  def destroy
    @graph = Graph.find(params[:id])
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
end
