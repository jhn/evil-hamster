class TracksController < ApplicationController

  before_action :load_playlist, only: [:new, :create]
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  def new
    @track = @playlist.tracks.new
  end

  def create
    @track = @playlist.tracks.new(track_params)
    respond_to do |format|
      if @track.save
        format.html { redirect_to playlist_path(@track.playlist), notice: 'Track created' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to playlist_path(@track.playlist), notice: 'Track updated' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to playlist_path(@track.playlist), notice: 'Track destroyed' }
      format.json { head :no_content }
    end
  end

  private

  def load_playlist
    @playlist = Playlist.find(params[:playlist_id])
  end

  def set_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:title, :artist, :link)
  end

end
