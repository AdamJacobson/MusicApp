class BandsController < ApplicationController

  def new
    @band = Band.new
  end

  def create
    band = Band.new(band_params)

    if band.save
      redirect_to band_url(band)
    else
      flash[:errors] << band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = this_band
  end

  def update
    @band = this_band

    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def index
    @bands = Band.all
  end

  def show
    @band = this_band
  end

  private

  def this_band
    Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end

end
