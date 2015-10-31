class SpaceShipsController < ApplicationController
  before_action :set_spaceship, only: [:show, :edit, :update, :destroy]

  # GET /spaceships
  # GET /spaceships.json
  def index
    @spaceships = Spaceship.all
  end

  # GET /spaceships/1
  # GET /spaceships/1.json
  def show
  end

  # GET /spaceships/new
  def new
    @spaceship = Spaceship.new
  end

  # GET /spaceships/1/edit
  def edit
  end

  # POST /spaceships
  # POST /spaceships.json
  def create
    @spaceship = Spaceship.new(spaceship_params)

    respond_to do |format|
      if @spaceship.save
        format.html { redirect_to @spaceship, notice: 'Space ship was successfully created.' }
        format.json { render :show, status: :created, location: @spaceship }
      else
        format.html { render :new }
        format.json { render json: @spaceship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spaceships/1
  # PATCH/PUT /spaceships/1.json
  def update
    respond_to do |format|
      if @spaceship.update(spaceship_params)
        format.html { redirect_to @spaceship, notice: 'Space ship was successfully updated.' }
        format.json { render :show, status: :ok, location: @spaceship }
      else
        format.html { render :edit }
        format.json { render json: @spaceship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaceships/1
  # DELETE /spaceships/1.json
  def destroy
    @spaceship.destroy
    respond_to do |format|
      format.html { redirect_to spaceships_url, notice: 'Space ship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spaceship
      @spaceship = Spaceship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spaceship_params
      params.require(:spaceship).permit(:name)
    end
end
