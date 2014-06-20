class BookmarksController < ApplicationController
  
  def new
    @bookmark = Bookmark.new
  end

  def create

  end

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def destroy

  end


end
