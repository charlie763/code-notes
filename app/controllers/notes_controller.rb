class NotesController < ApplicationController
  def new
    @note = Note.new
    @language = @note.build_language
    @note.topics.build

    @language_names = Language.possible_names
    @topic_names = Topic.names
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
    raise params.inspect
  end

end
