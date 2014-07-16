require 'rails_helper'

describe 'get /query' do

  it 'reads in a text file and returns a json blob' do


    get '/query', {}, {'Accept' => 'application/json'}

    expected = [
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

    expect(response.code.to_i).to eq 200
    expect(JSON.parse(response.body)).to eq(expected)
  end

end