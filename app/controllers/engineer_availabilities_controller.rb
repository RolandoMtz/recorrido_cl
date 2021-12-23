class EngineerAvailabilitiesController < ApplicationController
  before_action :set_engineer_availability, only: %i[ show edit update destroy ]

  # GET /engineer_availabilities or /engineer_availabilities.json
  def index
    @engineer_availabilities = EngineerAvailability.all
  end

  # GET /engineer_availabilities/1 or /engineer_availabilities/1.json
  def show
  end

  # GET /engineer_availabilities/new
  def new
    @engineer_availability = EngineerAvailability.new
  end

  # GET /engineer_availabilities/1/edit
  def edit
  end

  # POST /engineer_availabilities or /engineer_availabilities.json
  def create
    @engineer_availability = EngineerAvailability.new(engineer_availability_params)

    respond_to do |format|
      if @engineer_availability.save
        format.html { redirect_to engineer_availabilities_url, notice: "Engineer availability was successfully created." }
        format.json { render :show, status: :created, location: @engineer_availability }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @engineer_availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engineer_availabilities/1 or /engineer_availabilities/1.json
  def update
    respond_to do |format|
      if @engineer_availability.update(engineer_availability_params)
        format.html { redirect_to engineer_availabilities_url, notice: "Engineer availability was successfully updated." }
        format.json { render :show, status: :ok, location: @engineer_availability }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @engineer_availability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engineer_availabilities/1 or /engineer_availabilities/1.json
  def destroy
    @engineer_availability.destroy

    respond_to do |format|
      format.html { redirect_to engineer_availabilities_url, notice: "Engineer availability was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engineer_availability
      @engineer_availability = EngineerAvailability.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def engineer_availability_params
      params.require(:engineer_availability).permit(:nombre, :disponibilidad, :color)
    end
end
