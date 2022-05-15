class JourneysController < ApplicationController
  before_action :set_journey, only: %i[show edit update destroy]

  # GET /journeys
  def index
    @journeys = Journey.all
  end

  # GET /journeys/1
  def show
  end

  # GET /journeys/new
  def new
    @journey = Journey.new
  end

  # GET /journeys/1/edit
  def edit
  end

  # POST /journeys
  def create
    @journey = Journey.new(journey_params)

    if @journey.save
      redirect_to @journey, notice: "Journey was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /journeys/1
  def update
    if @journey.update(journey_params)
      redirect_to @journey, notice: "Journey was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /journeys/1
  def destroy
    @journey.destroy!
    redirect_to journeys_url, notice: "Journey was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_journey
    @journey = Journey.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def journey_params
    params.require(:journey).permit(:title)
  end
end
