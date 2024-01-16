class PokemonsController < ApplicationController
  # Before running the specified actions (show, update, destroy), set the pokemon.
  before_action :set_pokemon, only: %i[ show update destroy ]

   # GET /pokemons
  # Retrieves a list of all pokemons.
  def index
   # Fetch all pokemons from the database.
   @pokemons = Pokemon.all

    # Render the list of pokemons in JSON format.
    render json: @pokemons
  end

  # GET /pokemons/:id
  # Retrieves details of a specific pokemon by its ID.
  def show
    # Render the details of the specific pokemon in JSON format.
    render json: @pokemon
  end


   # POST /pokemons
  # Creates a new pokemon based on the provided parameters.
  def create
     # Initialize a new Pokemon object with parameters from the request.
     @pokemon = Pokemon.new(pokemon_params)

    # Check if the pokemon is successfully saved to the database.
    if @pokemon.save
      # Render the details of the created pokemon in JSON format.
      render json: @pokemon, status: :created, location: @pokemon
    else
      # Render errors in JSON format if there are validation errors.
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/:id
  # Updates an existing pokemon with new parameters.
  def update
    # Check if the pokemon is successfully updated in the database.
    if @pokemon.update(pokemon_params)
      # Render the updated details of the pokemon in JSON format.
      render json: @pokemon
    else
      # Render errors in JSON format if there are validation errors.
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/:id
  # Deletes a specific pokemon by its ID.
  def destroy
     # Destroy the specific pokemon in the database.
     @pokemon.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Sets the @pokemon instance variable based on the :id parameter.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

     # Only allow a list of trusted parameters through.
    # Defines the permitted parameters for creating or updating a pokemon.
   def pokemon_params
      params.require(:pokemon).permit(:name, :pokemon_type, :size, :weight, :date_capture)
    end
end
