class StaticController < ApplicationController
  def start
    redirect_to journeys_path if current_user
  end
end
