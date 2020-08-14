class NotesController < ApplicationController
  def new
    @note = Note.new
    @note.build_language
    @note.topics.build
    @note.code_snippets.build

    new_note_template
  end

  def show
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
      redirect_to user_note_path(current_user, @note.id)
    else
      @note.topics.build if @note.topics.empty?
      @note.code_snippets.build if @note.code_snippets.empty?
      new_note_template
      render 'new'
    end
  end

  private
  def note_params
    params.require(:note).permit(:title, :summary, language_attributes: [:name], topics_attributes: [:name], code_snippets_attributes: [:code, :annotation])
  end

  def new_note_template
    @language_names = Language.possible_names
    @topic_names = Topic.names
  end
end
