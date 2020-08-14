class TopicsController < ApplicationController
  def show
    @language = Language.find_by(id: params[:language_id])
    @topic = Topic.find_by(id: params[:id])
    @notes = Note.search(language: @language.name, topic: @topic.name)
  end
end
