class ChampionsController < ApplicationController
  before_action :set_champion, only: %i[ show update destroy ]

  # GET /champions
  def index
    @champions = Champion.all

    render xml: { champions: @champions.as_json(root: 'champion', except: [:created_at, :updated_at]) }
  end

  # GET /champions/id
  def show
    render xml: { champion: @champion.as_json(except: [:created_at, :updated_at]) }
  end

  # POST /champions
  def create
    @champion = Champion.new(champion_params)

    if @champion.save
      # render json: @champion, status: :created, location: @champion
      render xml: @champion.as_json
    else
      # render json: @champion.errors, status: :unprocessable_entity
      render xml: @champion.errors.as_json
    end
  end

  # PATCH/PUT /champions/1
  def update
    if @champion.update(champion_params)
      # render json: @champion
      render xml: @champion.as_json
    else
      # render json: @champion.errors, status: :unprocessable_entity
      render xml: @champion.errors.as_json

    end
  end

  # DELETE /champions/1
  def destroy
    @champion.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_champion
      @champion = Champion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def champion_params
      params.require(:champion).permit(:name, :pv, :damage, :speed, :shield)
    end
end
