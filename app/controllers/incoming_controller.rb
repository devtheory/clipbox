class IncomingController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    @user = User.where(email: params['sender']).first
    @topic = Topic.where(name: params[:subject]).first_or_create
    unless @user.name == "User"
      @topic.bookmarks.create(link: params['stripped-text'], user_id: @user.id)
    end
    head 200
  end
  
end