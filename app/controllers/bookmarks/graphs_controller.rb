# frozen_string_literal: true

module Bookmarks
  class GraphsController < ApplicationController
    before_action :find_bookmark, only: %i[destroy]
    before_action :find_graph, only: %i[destroy]

    def destroy
      if @bookmark.graphs.delete(@graph)
        flash[:success] = 'Graph was successfully removed from bookmark'
        redirect_to workspace_path
      else
        flash[:error] = 'Something went wrong'
        redirect_to workspace_path
      end
    end

    private

    def find_bookmark
      @bookmark = current_user.bookmarks.find(params[:bookmark_id])
    end

    def find_graph
      @graph = Graph.find(params[:id])
    end
  end
end
