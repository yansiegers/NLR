# frozen_string_literal: true

module Bookmarks
  class GraphsController < ApplicationController
    before_action :find_bookmark, only: %i[new create destroy]
    before_action :find_graph, only: %i[destroy]

    def new; end

    def create
      if @bookmark.graphs << Graph.find(params[:graph_id])
        flash[:success] = 'Graph successfully added to bookmark'
        redirect_to workspace_path
      else
        # FIXME: Does not work like intended, it doesn't get here on validation error
        flash[:error] = 'Something went wrong'
        render :new, status: :unprocessable_entity
      end
    end

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
      return Bookmark.all unless current_user

      @bookmark = current_user.bookmarks.find(params[:bookmark_id])
    end

    def find_graph
      @graph = Graph.find(params[:id])
    end
  end
end
