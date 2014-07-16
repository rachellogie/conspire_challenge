require 'rails_helper'

describe 'get /query' do

  it 'reads in a text file and returns a json blob' do

    get '/query', {}, {'Accept' => 'application/json'}

    partial_expected =
      {
        "filename" => "claims_to_fame.txt",
        "key" => "Boulder, CO",
        "value" => "mountains and marijuana"
      }

    expect(response.code.to_i).to eq 200
    expect(JSON.parse(response.body)).to include(partial_expected)
  end

end