class AlbumsController < ApplicationController

  def new
    @album = Album.new
    @all_bands = Band.all
    @band = Band.find(params[:band_id])
  end

  def create
    album = Album.new(album_params)

    if album.save
      redirect_to album_url(album)
    else
      flash[:errors] << album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    @tracks = @album.tracks
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :live)
  end

end
