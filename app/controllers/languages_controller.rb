class LanguagesController < ApplicationController
  def index
    @languages = current_user.languages.distinct
  end

  def show
  end
end
