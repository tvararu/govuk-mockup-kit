class ExportController < ApplicationController
  before_action :set_journey

  # GET /journeys/1/export
  def show
  end

  # POST /journeys/1/export
  def create
    system "rails export #{@journey.id}"

    redirect_to journey_export_path
  end

  private

  def set_journey
    @journey = Journey.find(params[:journey_id])
  end
end
