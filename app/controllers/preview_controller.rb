class PreviewController < ApplicationController
  before_action :set_journey

  def show
  end

  def page
    # TODO: Fix hacky code
    @page = @journey.pages.find(params[:id])
    current_index = @journey.pages.find_index(@page)
    next_index = current_index + 1
    next_page = @journey.pages.to_a.at(next_index)

    @next_path =
      (
        if next_page.nil?
          preview_confirmation_path
        else
          preview_page_path(id: next_page.id)
        end
      )
  end

  def confirmation
  end

  private

  def set_journey
    @journey = Journey.find(params[:journey_id])
  end
end
