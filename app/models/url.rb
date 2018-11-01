class Url < ApplicationRecord
  include CharsArray
  include LinksGenerator

  validates :url_orginal, presence: true
  validates :url_orginal, url: true

  before_create :generate_short_url
end
