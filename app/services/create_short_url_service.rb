class CreateShortUrlService
  def initialize(params)
    @url_orginal = params[:url_orginal]
  end

  def call
    @url = Url.new(url_orginal: @url_orginal)
    @url.clean_url
    if @url.new_link?
      @url
    else
      Url.find_by(url_clean: @url.url_clean)
    end
  end
end
