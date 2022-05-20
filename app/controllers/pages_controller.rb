class PagesController < ApplicationController
  before_action :set_page, only: %i[edit update destroy]

  # GET /journey/1/pages/new
  def new
    @page = Journey.find(params[:journey_id]).pages.new
  end

  # GET /journey/1/pages/1/edit
  def edit
  end

  # POST /journey/1/pages
  def create
    @page = Journey.find(params[:journey_id]).pages.new(page_params)

    if @page.save
      flash[:success] = "Page was successfully created."
      redirect_to @page.journey
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /journey/1/pages/1
  def update
    if @page.update(page_params)
      flash[:success] = "Page was successfully updated."
      redirect_to @page.journey
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /journey/1/pages/1
  def destroy
    @page.destroy!
    flash[:success] = "Page was successfully destroyed."
    redirect_to @page.journey
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:title)
  end
end
