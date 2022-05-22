class ExportsController < ApplicationController
  before_action :set_journey

  # GET /journeys/1/exports
  def index
  end

  # GET /journeys/1/exports/1
  def show
    send_export(@journey.exports.find(params[:id]))
  end

  # POST /journeys/1/exports
  def create
    system "rails export #{@journey.id}"

    send_export(@journey.exports.last)
  end

  private

  def set_journey
    @journey = Journey.find(params[:journey_id])
  end

  def send_export(export)
    send_data(
      export.data,
      filename: export.name.gsub("tmp/", ""),
      type: "application/zip"
    )
  end
end
