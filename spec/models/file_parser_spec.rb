require 'rails_helper'

describe FileParser do

  it 'parses a textfile and returns an array of hashes' do

    input = <<HEREDOC
Led Zeppelin\tlameness
platypuses\tlikely things
Led Zeppelin\tMaroon 5
Boulder, CO\tHouston
HEREDOC

    actual = FileParser.new(input, 'opposites.txt').parse_file

    expected = [
      {"filename" => "opposites.txt", "key" => "Led Zeppelin", "value" => "lameness"},
      {"filename" => "opposites.txt", "key" => "platypuses", "value" => "likely things"},
      {"filename" => "opposites.txt", "key" => "Led Zeppelin", "value" => "Maroon 5"},
      {"filename" => "opposites.txt", "key" => "Boulder, CO", "value" => "Houston"}
    ]

    expect(actual).to eq(expected)

  end
end