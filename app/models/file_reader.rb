class FileReader

  def initialize
    @path = '/Users/rachellogie/gSchoolWork/opposites.txt'
  end

  def to_hash(sort='fkv')
    text = File.read(@path)
    file_name = File.basename(@path)

    array_of_lines = FileParser.new(text, file_name).parse_file

    sort = 'fkv' if sort.nil?
    sorted_array_of_lines = ArraySorter.new(array_of_lines).sort_lines(sort)

    sorted_array_of_lines
  end

end