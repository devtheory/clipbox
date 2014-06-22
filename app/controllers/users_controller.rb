class UsersController < ApplicationController
  
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @topics_hash = {}
    @bookmarks.each do |bookmark|
      if @topics_hash.has_key?("#{bookmark.topic_id}")
        @topics_hash["#{bookmark.topic_id}"] << bookmark.link
      else
        @topics_hash["#{bookmark.topic_id}"] = []
        @topics_hash["#{bookmark.topic_id}"] << bookmark.link
      end
    end
  end
end