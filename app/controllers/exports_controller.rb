class ExportsController < ApplicationController
  before_action :set_journey

  # GET /journeys/1/exports
  def index
  end

  # GET /journeys/1/exports/1
  def show
  end

  # POST /journeys/1/exports
  def create
    system "rails export #{@journey.id}"

    redirect_to journey_export_path
  end

  private

  def set_journey
    @journey = Journey.find(params[:journey_id])
  end
end
