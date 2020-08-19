class NotesController < ApplicationController
  def new
    @note = Note.new
    build_note_form
  end

  def create
    @note = Note.new(basic_note_params)
    @note.add_language(language_params)
    new_topics = @note.add_topics(topics_params)
    @note.user = current_user

    validate_language
    validate_topics(new_topics)
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
    @note.add_language(language_params)
    new_topics = @note.add_topics(topics_params)

    validate_language
    validate_topics(new_topics)

    if @note.update(basic_note_params)
      redirect_to note_path(@note)
    else
      build_note_form
      render 'edit'
    end
  end

  def destroy

  end

  private
  def basic_note_params
    params.require(:note).permit(:id, :title, :summary, code_snippets_attributes: [:id, :code, :annotation])
  end

  def language_params
    params.require(:note).permit(language_attributes: [:name])[:language_attributes]
  end

  def topics_params
    params.require(:note).permit(topics_attributes: [:name])[:topics_attributes]
  end

  def build_note_form
    @note.build_language unless @note.language
    @note.topics.build if @note.topics.empty?
    @note.code_snippets.build if @note.code_snippets.empty?
    @language_names = Language.possible_names
    @topics = Topic.all
  end

  def validate_language
    @note.language.valid?
  end
  
  def validate_topics(topics)
    if @note.invalid? && @note.errors.details.keys.all?(:"topics.name") 
      @note.topics.delete(topics)
    end
  end

  def find_note_by_id
    Note.find_by(id: params[:id])
  end

  def display_search_placeholder(attribute)
    ": #{params[:terms][attribute]}" if params[:terms][attribute].present? 
  end
end
