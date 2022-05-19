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
      flash[:success] = "Journey was successfully created."
      redirect_to @journey
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /journeys/1
  def update
    if @journey.update(journey_params)
      flash[:success] = "Journey was successfully updated."
      redirect_to @journey
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /journeys/1
  def destroy
    @journey.destroy!
    flash[:success] = "Journey was successfully destroyed."
    redirect_to journeys_url
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
