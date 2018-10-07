class Url < ApplicationRecord
    include CharsArray
    
    validates :url_orginal, presence: true
    validates :url_orginal, url: true

    before_create :generate_short_url

    def new_link?
        find_duplicate.nil?
    end

    def find_duplicate
        Url.find_by_url_clean(self.url_clean)
    end

    def clean_url
        clean_url = self.url_orginal.strip
        clean_url = clean_url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
        clean_url.slice!(-1) if clean_url[-1] == '/'
        self.url_clean = clean_url
    end

    def generate_short_url
        short_url = generate_string_url(8)
        until Url.find_by_url_short(generate_string_url(8)).nil?
            short_url = generate_string_url(8)
        end
        self.url_short = short_url
    end
end