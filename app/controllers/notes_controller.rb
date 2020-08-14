class NotesController < ApplicationController
  def new
    @note = Note.new
    @note.build_language
    @note.topics.build
    @note.code_snippets.build

    add_language_and_topic_names
  end

  def show
    @note = Note.find_by(id: params[:id])
  end

  def edit
  end

  def index
    if terms = params[:terms]
      @notes = Note.search(terms)
    else 
      @notes = []
    end
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to note_path(@note.id)
    else
      @note.topics.build if @note.topics.empty?
      @note.code_snippets.build if @note.code_snippets.empty?
      add_language_and_topic_names
      render 'new'
    end
  end

  private
  def note_params
    params.require(:note).permit(:title, :summary, language_attributes: [:name], topics_attributes: [:name], code_snippets_attributes: [:code, :annotation])
  end

  def add_language_and_topic_names
    @language_names = Language.possible_names
    @topic_names = Topic.names
  end
end
