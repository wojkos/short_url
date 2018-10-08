module CharsArray
  extend ActiveSupport::Concern

  def generate_chars_array
    ('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a
  end

  def generate_string_url(times)
    array = generate_chars_array
    short = []
    times.times do
      short << array.sample
    end
    short.join
  end
end
