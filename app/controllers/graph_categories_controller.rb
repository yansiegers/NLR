# frozen_string_literal: true


class GraphCategoriesController < ApplicationController
  before_action :find_workspace, :find_graph_category, only: %i[destroy]

  def destroy
    if @workspace.graphs.delete(@graph_category.graphs)
      flash[:success] = 'GraphCategory was successfully removed from workspace'
      redirect_to workspace_path(@workspace)
    else
      flash[:error] = 'Something went wrong'
      redirect_to workspace_path(@workspace)
    end
  end

  private

  def find_workspace
    @workspace = current_user.workspaces.find(params[:workspace_id])
  end

  def find_graph_category
    @graph_category = GraphCategory.find(params[:id])
  end
end
