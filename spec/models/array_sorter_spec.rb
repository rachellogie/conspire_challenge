require 'rails_helper'

describe ArraySorter do

  before do
    @input = [
      {
        "filename" => "allooothere.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "bacon.txt",
        "key" => "platypuses",
        "value" => "lameness"
      },
      {
        "filename" => "otherstuff.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "opposites.txt",
        "key" => "Boulder, CO",
        "value" => "Houston"
      },
    ]
  end
  
  it 'returns an array of lines sorted by value, then key, then filename' do

    array_sorter = ArraySorter.new(@input)

    expected = [
      {
        "filename" => "opposites.txt",
        "key" => "Boulder, CO",
        "value" => "Houston"
      },
      {
        "filename" => "bacon.txt",
        "key" => "platypuses",
        "value" => "lameness"
      },
      {
        "filename" => "allooothere.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "otherstuff.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
    ]

    actual = array_sorter.sort_lines('vkf')

    expect(actual).to eq expected
  end

  it 'if only k is passed in, then it will sort it by key, then filename, then value' do

    array_sorter = ArraySorter.new(@input)

    expected = [
      {
        "filename" => "opposites.txt",
        "key" => "Boulder, CO",
        "value" => "Houston"
      },
      {
        "filename" => "bacon.txt",
        "key" => "platypuses",
        "value" => "lameness"
      },
      {
        "filename" => "allooothere.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "otherstuff.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
    ]

    actual = array_sorter.sort_lines('k')

    expect(actual).to eq expected
  end
end