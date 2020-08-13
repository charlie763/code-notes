class NotesController < ApplicationController
  def new
  end

  def show
  end

  def edit
  end

  def index
    @notes = Note.search(terms)
  end

end
