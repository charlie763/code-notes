module NotesHelper
  def build_note_form
    @note.build_language unless @note.language
    @note.topics.build if @note.topics.empty?
    @note.code_snippets.build if @note.code_snippets.empty?
    @note.external_resources.build if @note.external_resources.empty?
    @language_names = Language.possible_names
    @topics = Topic.all
  end

  def find_note_by_id
    Note.find_by(id: params[:id])
  end

  def display_search_placeholder(attribute)
    ": #{params[:terms][attribute]}" if params[:terms][attribute].present? 
  end

  def validate_language
    @note.language.valid?
  end
end
