class TopicsController < ApplicationController
  def show
    @language = Language.find_by(id: params[:language_id])
    @topic = Topic.find_by(id: params[:id])
    @user = params[:terms] ? params[:terms][:user] : nil
    @notes = Note.search({language: @language.name, topic: @topic.name, user: @user}, current_user)
  end

  def destroy
    @note = Note.find(params[:note_id])
    @topic = Topic.find(params[:id])
    @note.topics.destroy(@topic)
    redirect_to edit_note_path(@note)
  end
end
