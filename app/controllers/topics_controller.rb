class TopicsController < ApplicationController
  def show
    @language = Language.find_by(id: params[:language_id])
    @topic = Topic.find_by(id: params[:id])
    @user = params[:terms] ? params[:terms][:user] : nil
    @notes = Note.search({language: @language.name, topic: @topic.name, user: @user}, current_user)
  end
end
