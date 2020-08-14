class LanguagesController < ApplicationController
  def index
    @languages = current_user.languages.distinct
  end

  def show
    @language = Language.find_by(id: params[:id])
    @topics = @language.topics.distinct
  end
end
