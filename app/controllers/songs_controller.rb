class SongsController < ApplicationController
  before_action :set_billboard
  before_action :set_artist
  before_action :set_song, only: [:show, :update, :edit, :destroy]

  def index
    @songs = Billboard.song 
  end

  def show
  end

  def new
    @song = @billboard.song.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @song = Billboard.song.new(song_params)
    if @song.save
      redirect_to [@billboard, @song]
    else
      render :new 
    end
  end

  def update 
    if @song.update(song_params)
      redirect_to [@billboard, @song]
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to billboard_songs_path(@billboard)
  end

  private

  def set_billboard
    @billboard = Billboard.find(params)[:department_id])

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name)
  end
end
