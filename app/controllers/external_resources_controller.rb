class ExternalResourcesController < ApplicationController
  def new
    @external_resource = ExternalResource.new
    @language = Language.find_by(id: params[:language_id])
  end

  def create

  end
end
