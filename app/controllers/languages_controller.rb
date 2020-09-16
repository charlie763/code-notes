# frozen_string_literal: true

# Controller for viewing languages the user is associated with (via notes)
class LanguagesController < ApplicationController
  def index
    @languages = current_user.languages.distinct
    @search_languages = Language.search(params[:term])
  end

  def show
    @language = Language.find_by(id: params[:id])
    @topics = @language.topics.distinct
    @external_resources = @language.external_resources.distinct
  end
end
