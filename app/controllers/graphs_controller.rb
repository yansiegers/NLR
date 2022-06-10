# frozen_string_literal: true


class GraphsController < ApplicationController
  before_action :find_workspace, :find_graph, only: %i[destroy]

  def destroy # Unused
    # FIXME: Only graphs from the workspace gets removed, but not from the category
    if @workspace.graphs.delete(@graph)
      flash[:success] = 'Graph was successfully removed from workspace'
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

  def find_graph
    @graph = Graph.find(params[:id])
  end
end
