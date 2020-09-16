# frozen_string_literal: true

# Controller for the ExternalResource Model. Only has new and create actions as viewing
# external resources only takes place via the Note and Language controllers
class ExternalResourcesController < ApplicationController
  def new
    @external_resource = ExternalResource.new
    @language = find_language
  end

  def create
    @external_resource = ExternalResource.new(external_resource_params)
    @language = find_language
    @external_resource.language = @language
    @external_resource.user = current_user
    if @external_resource.save
      redirect_to language_path(@language)
    else
      render 'new'
    end
  end

  private

  def external_resource_params
    params.require(:external_resource).permit(:name, :description, :url)
  end

  def find_language
    Language.find_by(id: params[:language_id])
  end
end
