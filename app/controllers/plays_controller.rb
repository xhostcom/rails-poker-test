class PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_play, only: %i[ show edit update destroy ]

  # GET /plays or /plays.json
  def index
    @plays = Play.all
  end

  # GET /plays/1 or /plays/1.json
  def show
  end

  # GET /plays/new
  def new
    @play = Play.new
  end

  # GET /plays/1/edit
  def edit
  end

  # POST /plays or /plays.json
  def create
    @play = Play.new(play_params)

    respond_to do |format|
      if @play.save
        format.html { redirect_to play_url(@play), notice: "Play was successfully created." }
        format.json { render :show, status: :created, location: @play }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plays/1 or /plays/1.json
  def update
    respond_to do |format|
      if @play.update(play_params)
        format.html { redirect_to play_url(@play), notice: "Play was successfully updated." }
        format.json { render :show, status: :ok, location: @play }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plays/1 or /plays/1.json
  def destroy
    @play.destroy

    respond_to do |format|
      format.html { redirect_to plays_url, notice: "Play was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play
      @play = Play.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def play_params
      params.require(:play).permit(:status)
    end
end
