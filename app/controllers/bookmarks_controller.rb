# frozen_string_literal: true

class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      flash[:success] = 'Bookmark successfully created'
      redirect_to bookmarks_path
    else
      flash[:error] = 'Something went wrong'
      render :new, status: :unprocessable_entity
    end
  end


  private

  def bookmark_params
    params.require(:bookmark)
          .permit(:name, :favorite, :user_id)
  end
end
