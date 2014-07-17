require 'rails_helper'

describe ArraySorter do

  before do
    @input = [
      {
        "filename" => "a.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "a.txt",
        "key" => "Boulder, CO",
        "value" => "Houston"
      },
      {
        "filename" => "a.txt",
        "key" => "zeppelin",
        "value" => "magic"
      },
      {
        "filename" => "b.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "b.txt",
        "key" => "hot like sauce",
        "value" => "boo"
      },
      {
        "filename" => "c.txt",
        "key" => "finally moving",
        "value" => "boo"
      },

    ]
  end

  it 'returns an array sorted properly when given 3 letters' do

    array_sorter = ArraySorter.new(@input)

    expected = [
      {
        "filename" => "c.txt",
        "key" => "finally moving",
        "value" => "boo"
      },
      {
        "filename" => "b.txt",
        "key" => "hot like sauce",
        "value" => "boo"
      },
      {
        "filename" => "a.txt",
        "key" => "Boulder, CO",
        "value" => "Houston"
      },
      {
        "filename" => "a.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "b.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "a.txt",
        "key" => "zeppelin",
        "value" => "magic"
      },
    ]

    actual = array_sorter.sort_lines('vkf')

    expect(actual).to eq expected
  end

  it 'returns array in proper order when given only 1 letter (or 2 or 3 of the same letter)' do

    array_sorter = ArraySorter.new(@input)

    expected = [
      {
        "filename" => "a.txt",
        "key" => "Boulder, CO",
        "value" => "Houston"
      },
      {
        "filename" => "c.txt",
        "key" => "finally moving",
        "value" => "boo"
      },
      {
        "filename" => "b.txt",
        "key" => "hot like sauce",
        "value" => "boo"
      },
      {
        "filename" => "a.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "a.txt",
        "key" => "zeppelin",
        "value" => "magic"
      },
      {
        "filename" => "b.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
    ]
    actual = array_sorter.sort_lines('k')

    expect(actual).to eq expected

    actual = array_sorter.sort_lines('kk')

    expect(actual).to eq expected

    actual = array_sorter.sort_lines('kkk')

    expect(actual).to eq expected
  end

  it 'returns array in proper order when given only 2 letters' do
    array_sorter = ArraySorter.new(@input)

    expected = [
      {
        "filename" => "a.txt",
        "key" => "Boulder, CO",
        "value" => "Houston"
      },
      {
        "filename" => "a.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "a.txt",
        "key" => "zeppelin",
        "value" => "magic"
      },
      {
        "filename" => "b.txt",
        "key" => "hot like sauce",
        "value" => "boo"
      },
      {
        "filename" => "b.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "c.txt",
        "key" => "finally moving",
        "value" => "boo"
      },
    ]

    actual = array_sorter.sort_lines('fv')

    expect(actual).to eq expected
  end

  it 'returns array in proper order if more than 3 letters are given' do
    array_sorter = ArraySorter.new(@input)

    expected = [
      {
        "filename" => "a.txt",
        "key" => "Boulder, CO",
        "value" => "Houston"
      },
      {
        "filename" => "a.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "a.txt",
        "key" => "zeppelin",
        "value" => "magic"
      },
      {
        "filename" => "b.txt",
        "key" => "hot like sauce",
        "value" => "boo"
      },
      {
        "filename" => "b.txt",
        "key" => "zeppelin",
        "value" => "lameness"
      },
      {
        "filename" => "c.txt",
        "key" => "finally moving",
        "value" => "boo"
      },
    ]

    actual = array_sorter.sort_lines('ffffvkvvvkffkkvkkvvkvkvf')

    expect(actual).to eq expected
  end

end