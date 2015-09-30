class SpaceShipsController < ApplicationController
  before_action :set_space_ship, only: [:show, :edit, :update, :destroy]

  # GET /space_ships
  # GET /space_ships.json
  def index
    @space_ships = SpaceShip.all
  end

  # GET /space_ships/1
  # GET /space_ships/1.json
  def show
  end

  # GET /space_ships/new
  def new
    @space_ship = SpaceShip.new
  end

  # GET /space_ships/1/edit
  def edit
  end

  # POST /space_ships
  # POST /space_ships.json
  def create
    @space_ship = SpaceShip.new(space_ship_params)

    respond_to do |format|
      if @space_ship.save
        format.html { redirect_to @space_ship, notice: 'Space ship was successfully created.' }
        format.json { render :show, status: :created, location: @space_ship }
      else
        format.html { render :new }
        format.json { render json: @space_ship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /space_ships/1
  # PATCH/PUT /space_ships/1.json
  def update
    respond_to do |format|
      if @space_ship.update(space_ship_params)
        format.html { redirect_to @space_ship, notice: 'Space ship was successfully updated.' }
        format.json { render :show, status: :ok, location: @space_ship }
      else
        format.html { render :edit }
        format.json { render json: @space_ship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /space_ships/1
  # DELETE /space_ships/1.json
  def destroy
    @space_ship.destroy
    respond_to do |format|
      format.html { redirect_to space_ships_url, notice: 'Space ship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space_ship
      @space_ship = SpaceShip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_ship_params
      params.require(:space_ship).permit(:name)
    end
end
