class TracksController < ApplicationController

  def new
    @track = Track.new
    @albums = Album.all
  end

  def create
    track = Track.create(track_params)

    if track.save
      redirect_to track_url(track)
    else
      flash[:errors] << track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics, :bonus)
  end

end
