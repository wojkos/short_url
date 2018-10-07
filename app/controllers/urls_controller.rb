class UrlsController < ApplicationController

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.clean_url

    if @url.new_link?
      if @url.save
        render js: "document.getElementById('short_url_box').classList.remove('d-none');
          document.getElementById('short_url').innerText='http://#{request.host}/#{@url.url_short}/';"
      else
        flash[:alert] = @url.errors.full_messages
        redirect_to :root
      end
    else
      @url_in_database =Url.find_by_url_clean(@url.url_clean)
      render js: "document.getElementById('short_url_box').classList.remove('d-none');
      document.getElementById('short_url').innerText='http://#{request.host}/#{@url_in_database.url_short}/';"
    end
  end

  def show
    @url = Url.find_by_url_short(params[:url_short])
    redirect_to "http://#{@url.url_clean}/"
  end

  private
    def url_params
      params.require(:url).permit(:url_orginal)
    end
end
