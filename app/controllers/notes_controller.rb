class NotesController < ApplicationController
  include NotesHelper

  def new
    @note = Note.new
    build_note_form
  end

  def create
    @note = Note.new(basic_note_params)
    @note.topics << Topic.find_or_create_by(topic_params)
    @note.add_language(language_params)
    @note.user = current_user

    validate_language
    if @note.save
      redirect_to note_path(@note.id)
    else
      build_note_form
      render 'new'
    end
  end

  def show
    @note = find_note_by_id
  end

  def index
    if params[:terms]
      @language = display_search_placeholder(:language)
      @topic = display_search_placeholder(:topic)
      @keyword = display_search_placeholder(:keyword)
    end

    if terms = params[:terms]
      @notes = Note.search(terms, current_user)
    else 
      @notes = []
    end
  end

  def edit
    @note = find_note_by_id
    build_note_form
  end

  def update
    @note = find_note_by_id
    topic = Topic.find_or_create_by(topic_params)
    topic.notes << @note unless @note.topics.pluck(:id).include?(topic.id)
    @note.add_language(language_params)

    validate_language
    if @note.update(basic_note_params)
      redirect_to note_path(@note)
    else
      build_note_form
      render 'edit'
    end
  end

  def destroy
    @note = find_note_by_id
    @note.code_snippets.destroy_all
    @note.destroy
    redirect_to notes_path
  end

  private
  def basic_note_params
    params.require(:note).permit(:id, 
      :title, 
      :summary, 
      code_snippets_attributes: [:id, :code, :annotation],
      external_resources_attributes: [:id, :name, :url, :description, :user_id]
    )
  end

  def language_params
    params.require(:note).permit(language_attributes: [:name])[:language_attributes]
  end

  def topic_params
    params.require(:note).permit(topics_attributes: [:name])[:topics_attributes]["0"]
  end
end
