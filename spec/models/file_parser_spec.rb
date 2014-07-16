require 'rails_helper'

describe FileParser do

  it 'reads in a file and returns an array of hashes' do

    input = <<HEREDOC
Led Zeppelin\tlameness
platypuses\tlikely things
Led Zeppelin\tMaroon 5
Boulder, CO\tHouston
HEREDOC

    file_name =  File.basename(File.expand_path('../../spec/fixtures/opposites.txt', __dir__))

    actual = FileParser.new(input, file_name).parse_file

    expected = [
      {"filename" => "opposites.txt", "key" => "Led Zeppelin", "value" => "lameness"},
      {"filename" => "opposites.txt", "key" => "platypuses", "value" => "likely things"},
      {"filename" => "opposites.txt", "key" => "Led Zeppelin", "value" => "Maroon 5"},
      {"filename" => "opposites.txt", "key" => "Boulder, CO", "value" => "Houston"}
    ]

    expect(actual).to eq(expected)

  end
end