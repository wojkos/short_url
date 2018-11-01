module LinksGenerator
  extend ActiveSupport::Concern

  def new_link?
    find_url_clean_duplicate.nil?
  end

  def find_url_clean_duplicate
    Url.find_by(url_clean: url_clean)
  end

  def clean_url
    clean_url = url_orginal.strip
    clean_url = clean_url.downcase.gsub(%r{(https?:\/\/)|(www\.)}, '')
    clean_url.slice!(-1) if clean_url[-1] == '/'
    self.url_clean = clean_url
  end

  def generate_short_url
    short_url = generate_string_url(8)
    short_url = generate_string_url(8) until Url.find_by(url_short: generate_string_url(8)).nil?
    self.url_short = short_url
  end
end
