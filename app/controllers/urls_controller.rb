class UrlsController < ApplicationController

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      p 'SAVE'
    else
      p 'ERROR'
    end
  end

  def show
    @url = Url.find_by_url_short(params[:url_short])
    redirect_to @url.url_orginal
  end

  private
    def url_params
      params.require(:url).permit(:url_orginal)
    end
end
