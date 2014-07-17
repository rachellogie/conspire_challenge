require 'rails_helper'

describe FileReader do

  it 'reads in all the files in the bucket and returns a hash' do
    file_reader = FileReader.new

    actual = file_reader.to_hash('f')

    partial_expected1 =
      {
        "filename" => "claims_to_fame.txt",
        "key" => "Boulder, CO",
        "value" => "mountains and marijuana"
      }

    partial_expected2 =
      {
        "filename" => "lead_singers.txt",
        "key" => "Beatles",
        "value" => "John Lennon"
      }

    expect(actual).to include partial_expected1
    expect(actual).to include partial_expected2
  end
end