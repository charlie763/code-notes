# frozen_string_literal: true

# Notes Controller. This controls the main interaction the user has with the app including
# searching for, viewing, creating and editing notes.
class NotesController < ApplicationController
  include NotesHelper

  def new
    @note = Note.new
    build_note_form
  end

  def create
    @note = Note.new(basic_note_params)
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
    redirect_to note_path(@note) and return unless @note.user == current_user

    if @note.update(basic_note_params)
      redirect_to note_path(@note)
    else
      build_note_form
      render 'edit'
    end
  end

  def destroy
    @note = find_note_by_id
    redirect_to note_path(@note) and return unless @note.user == current_user

    @note.code_snippets.destroy_all
    @note.destroy
    redirect_to notes_path
  end

  private

  def basic_note_params
    params.require(:note).permit(:id,
                                 :title,
                                 :summary,
                                 language_attributes: [:name],
                                 topics_attributes: [:name],
                                 code_snippets_attributes: %i[id code annotation],
                                 external_resources_attributes: %i[id name url description user_id])
  end
end
