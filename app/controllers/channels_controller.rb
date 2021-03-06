class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]

  # GET /channels
  # GET /channels.json
  def index
    respond_to do |format|
        format.html { @channels = Channel.all.paginate :page => params[:page] }
        format.json { @channels = Channel.all }
    end
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
  end
  
  # GET /channels/import
  def import
    @transmitter = Transmitter.new
    @array = Array.new
  end
  
  # POST /transmitters/import
  def importCreate
    params[:csv].split("|").each do |row|
      @channel = Channel.new
      @array = row.split(";")
      @transmitter = Transmitter.where(:place => @array[0]).first
      @channel.transmitter = @transmitter
      @channel.name = @array[1]
      @channel.frequency = @array[2]
      @channel.power = @array[3]
      @channel.save
    end
    render action: 'import'
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
    @transmitter = @channel.transmitter
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @channel }
      else
        format.html { render action: 'new' }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:transmitter_id, :name, :frequency, :power)
    end
end
