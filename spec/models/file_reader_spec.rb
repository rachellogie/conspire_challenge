require 'rails_helper'

describe FileReader do

  it 'reads in a file and returns a hash' do

    file_reader = FileReader.new

    actual = file_reader.to_hash

    partial_expected =
      {
        "filename" => "claims_to_fame.txt",
        "key" => "Boulder, CO",
        "value" => "mountains and marijuana"
      }

    expect(actual).to include partial_expected
  end

end