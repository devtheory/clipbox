class FavoritesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:bookmark_id])
    favorite = current_user.favorites.build(bookmark: @bookmark)

    if favorite.save
      redirect_to [@topic], notice: "Bookmark added to favorites"
    else
      flash[:error] = "Something went wrong"
      redirect_to [@topic, @bookmark]
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:bookmark_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      redirect_to [@topic], notice: "Bookmark unfavorited"
    else
      flash[:error] = "Something went wrong"
      redirect_to [@topic, @bookmark]
    end
  end
end
