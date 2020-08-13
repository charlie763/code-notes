class NotesController < ApplicationController
  def new
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

end
