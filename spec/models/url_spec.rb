require 'rails_helper'

RSpec.describe Url, type: :model do
  let!(:url) { Url.create(url_orginal: 'http://wkostanski.pl') }

  it { should validate_presence_of(:url_orginal) }

  # test url format
  not_valid_cases = ['aaaaa', 'www.gazeta.pl', 'example.com', 'test .pl']
  not_valid_cases.each do |not_valid_case|
    it { should_not allow_value(not_valid_case).for(:url_orginal) }
  end

  valid_cases = ['http://google.com', 'https://gazeta.pl', 'https://www.youtube.com/watch?v=QRxH-II0OsA', 'http://master.guru']
  valid_cases.each do |valid_case|
    it { should allow_value(valid_case).for(:url_orginal) }
  end
end
