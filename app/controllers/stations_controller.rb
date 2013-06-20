class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  # GET /stations
  # GET /stations.json
  def index
    respond_to do |format|
        format.html { @stations = Station.all.paginate :page => params[:page] }
        format.json { @stations = Station.all }
    end
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
  end
  
  # GET /stations/import
  def import
    @station = Station.new
    @csv = String.new
    @array = Array.new
  end

  # POST /stations/import
  def importCreate
    @station = Station.new
    @csv = String.new
    @array = params[:csv].split(";")
    
    @station.name = @array[0]
    @station.url = @array[1]
    @station.description = @array[2]
    @station.shortcut = @array[3]
    @station.genre = @array[4]
    
    if @station.save
      redirect_to @station, notice: 'Station was successfully imported.'
    else
      render action: 'import'
    end
    
  end
  
  # GET /stations/new
  def new
    @station = Station.new
    @example = Station.all.shuffle.first
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)
    @example = Station.all.shuffle.first

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render action: 'show', status: :created, location: @station }
      else
        format.html { render action: 'new' }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:name, :description, :url, :genre, :shortcut)
    end
end
