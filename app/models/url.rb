class Url < ApplicationRecord
    include CharsArray 
    before_create :generate_short_url

    def generate_short_url
        short_url = generate_string_url(8)
        until Url.find_by_url_short(generate_string_url(8)).nil?
            short_url = generate_string_url(8)
        end
        self.url_short = short_url
    end
end
