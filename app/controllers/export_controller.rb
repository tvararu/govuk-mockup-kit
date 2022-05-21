class ExportController < ApplicationController
  # GET /journeys/1/export
  def show
  end

  # POST /journeys/1/export
  def create
    system "rails export #{params[:journey_id]}"

    redirect_to journey_export_path
  end
end
