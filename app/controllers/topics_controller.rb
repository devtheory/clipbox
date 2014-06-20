class TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

  def create
    @user = current_user
    @topic = Topic.new(topic_params)

    if @topic.save
      UserMailer.welcome(@user).deliver
      redirect_to @topic, notice: "Topic created"
    else
      flash[:error] = "Topic not created"
      render :new
    end
  end

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks.all
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end

end
