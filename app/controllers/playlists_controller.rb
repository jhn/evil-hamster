class PlaylistsController < ApplicationController

  before_action :load_user, only: [:new, :create]
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  skip_before_action :require_user, :only => [:show]

  def new
    @playlist = @user.playlists.new
  end

  def create
    @playlist = @user.playlists.new(playlist_params)
    respond_to do |format|
      if @playlist.save
        format.html { redirect_to playlist_path(@playlist), notice: 'Playlist created' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    redirect_to root_url unless logged_in? || @playlist.public?
    @playlist
  end

  def edit
  end

  def share
    @playlist.public = true
    @playlist.update
  end

  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to playlist_path, notice: 'Playlist updated' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@playlist.user), notice: 'Playlist destroyed' }
      format.json { head :no_content }
    end
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:title, :type, :public)
  end
end
