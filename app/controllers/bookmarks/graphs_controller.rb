# frozen_string_literal: true

module Bookmarks
  class GraphsController < ApplicationController
    before_action :find_bookmark, only: %i[new create]

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

    private

    def find_bookmark
      @bookmark = current_user.bookmarks.find(params[:bookmark_id])
    end
  end
end
