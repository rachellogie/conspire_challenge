require 'rails_helper'

describe FileReader do

  it 'reads in a file and returns a hash' do

    file_reader = FileReader.new

    actual = file_reader.to_hash

    expected =  [
      {
        "filename" => "opposites.txt",
        "key" => "Boulder, CO",
        "value" => "Houston"
      },
      {
        "filename" => "opposites.txt",
        "key" => "Led Zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "opposites.txt",
        "key" => "Led Zeppelin",
        "value" => "Maroon 5"
      },
      {
        "filename" => "opposites.txt",
        "key" => "Led Zeppelin",
        "value" => "more stuff"
      },
      {
        "filename" => "opposites.txt",
        "key" => "platypuses",
        "value" => "likely things"
      },
    ]

    expect(actual).to eq expected
  end


end