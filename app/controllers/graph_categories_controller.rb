# frozen_string_literal: true

class GraphCategoriesController < ApplicationController
  before_action :find_graph_category, only: %i[edit update destroy]

  def index
    @graph_categories = GraphCategory.all
  end

  def new
    @graph_category = GraphCategory.new
  end

  def create
    @graph_category = GraphCategory.new(graph_category_params)
    if @graph_category.save
      flash[:success] = 'GraphCategory successfully created'
      redirect_to graph_categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @graph_category.update(graph_category_params)
      flash[:success] = 'GraphCategory was successfully updated'
      redirect_to graph_categories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @graph_category.graphs.clear && @graph_category.destroy
      flash[:success] = 'GraphCategory was successfully deleted'
      redirect_to graph_categories_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to graph_categories_path
    end
  end

  private

  def graph_category_params
    params.require(:graph_category)
          .permit(
            :name,
            graph_ids: []
          )
  end

  def find_graph_category
    @graph_category = GraphCategory.find(params[:id])
  end
end
