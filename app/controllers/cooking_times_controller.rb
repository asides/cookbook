class CookingTimesController < ApplicationController
  before_action :set_cooking_time, only: [:show, :edit, :update, :destroy]

  # GET /cooking_times
  # GET /cooking_times.json
  def index
    @cooking_times = CookingTime.all
  end

  # GET /cooking_times/1
  # GET /cooking_times/1.json
  def show
  end

  # GET /cooking_times/new
  def new
    @cooking_time = CookingTime.new
  end

  # GET /cooking_times/1/edit
  def edit
  end

  # POST /cooking_times
  # POST /cooking_times.json
  def create
    @cooking_time = CookingTime.new(cooking_time_params)

    respond_to do |format|
      if @cooking_time.save
        format.html { redirect_to cooking_times_path, notice: 'Cooking time was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cooking_time }
      else
        format.html { render action: 'new' }
        format.json { render json: @cooking_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cooking_times/1
  # PATCH/PUT /cooking_times/1.json
  def update
    respond_to do |format|
      if @cooking_time.update(cooking_time_params)
        format.html { redirect_to cooking_times_path, notice: 'Cooking time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cooking_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cooking_times/1
  # DELETE /cooking_times/1.json
  def destroy
    @cooking_time.destroy
    respond_to do |format|
      format.html { redirect_to cooking_times_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cooking_time
      @cooking_time = CookingTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cooking_time_params
      params.require(:cooking_time).permit(:title, :order)
    end
end
