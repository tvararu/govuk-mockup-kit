class PreviewController < ApplicationController
  def show
    @journey = Journey.find(params[:journey_id])
  end
end
