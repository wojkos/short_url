class Url < ApplicationRecord
    include CharsArray 
    before_create :generate_short_url

    def generate_short_url
        self.url_short = generate_string_url(8)
    end
end
