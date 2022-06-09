# frozen_string_literal: true

module Workspaces
  class GraphsController < ApplicationController
    before_action :find_workspace, only: %i[destroy]
    before_action :find_graph, only: %i[destroy]

    def destroy
      if @workspace.graphs.delete(@graph)
        flash[:success] = 'Graph was successfully removed from workspace'
        redirect_to dashboard_path
      else
        flash[:error] = 'Something went wrong'
        redirect_to dashboard_path
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
end
