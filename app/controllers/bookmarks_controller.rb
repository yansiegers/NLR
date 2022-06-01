# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :find_bookmark, only: %i[edit update destroy]

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

  def edit; end

  def update
    if @bookmark.update(bookmark_params)
      flash[:success] = 'Bookmark was successfully updated'
      redirect_to bookmarks_path
    else
      flash[:error] = 'Something went wrong'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark)
          .permit(:name, :favorite, :user_id)
  end

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
