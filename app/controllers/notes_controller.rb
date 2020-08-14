class NotesController < ApplicationController
  def new
    @note = Note.new
    build_note_form
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
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
    if terms = params[:terms]
      @notes = Note.search(terms)
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
    if @note.update(note_params)
      redirect_to note_path(@note)
    else
      build_note_form
      render 'edit'
    end
  end

  def destroy

  end

  private
  def note_params
    params.require(:note).permit(:title, :summary, language_attributes: [:name], topics_attributes: [:name], code_snippets_attributes: [:code, :annotation])
  end

  def build_note_form
    @note.build_language unless @note.language
    @note.topics.build if @note.topics.empty?
    @note.code_snippets.build if @note.code_snippets.empty?
    @language_names = Language.possible_names
    @topic_names = Topic.names
  end

  def find_note_by_id
    Note.find_by(id: params[:id])
  end
end
