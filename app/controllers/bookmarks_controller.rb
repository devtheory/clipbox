class BookmarksController < ApplicationController
  
  def new
    @bookmark = Bookmark.new
  end

  def create

  end

  def index
    @bookmarks = Bookmark.all
    @mybookmarks = Bookmark.where(user_id: current_user.id)
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      redirect_to topics_path
    else
      flash[:error] = "Something went wrong"
    end
  end
end