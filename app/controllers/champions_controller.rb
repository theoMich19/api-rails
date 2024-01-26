class ChampionsController < ApplicationController
  # Before running the specified actions (show, update, destroy), set the champion.
  before_action :set_champion, only: %i[ show update destroy ]

  # GET /champions
  # Retrieves a list of all champions.
  def index
    # Fetch all champions from the database.
    @champions = Champion.all

    # Render the list of champions in XML format.
    render xml: { champions: @champions.as_json(except: [:created_at, :updated_at]) }
  end

  # GET /champions/:id
  # Retrieves a specific champion by its ID.
  def show
    # Render the details of the specific champion in XML format.
    render xml: { champion: @champion.as_json(except: [:created_at, :updated_at]) }
  end

  # POST /champions
  # Creates a new champion based on the provided parameters.
  def create
    # Initialize a new Champion object with parameters from the request.
    @champion = Champion.new(champion_params)

    # Check if the champion is successfully saved to the database.
    if @champion.save
      # Render the details of the created champion in XML format.
      render xml: @champion.as_json
    else
      # Render errors in XML format if there are validation errors.
      render xml: @champion.errors.as_json
    end
  end


  # PATCH/PUT /champions/:id
  # Updates an existing champion with new parameters.
  def update
    # Check if the champion is successfully updated in the database.
    if @champion.update(champion_params)
      # Render the updated details of the champion in XML format.
      render xml: @champion.as_json
    else
      # Render errors in XML format if there are validation errors.
      render xml: @champion.errors.as_json
    end
  end

  # DELETE /champions/:id
  # Deletes a specific champion by its ID.
  def destroy
    # Destroy the specific champion in the database.
    @champion.destroy!
  end

  private
     # Use callbacks to share common setup or constraints between actions.
    # Sets the @champion instance variable based on the :id parameter.
    def set_champion
      @champion = Champion.find(params[:id])
    end

     # Only allow a list of trusted parameters through.
    # Defines the permitted parameters for creating or updating a champion.
   def champion_params
      params.require(:champion).permit(:name, :pv, :damage, :speed, :shield)
    end
end
