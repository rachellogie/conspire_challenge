class FileReader

  def initialize
    @path = '/Users/rachellogie/gSchoolWork/opposites.txt'
  end

  def to_hash
    text = File.read(@path)
    file_name = File.basename(@path)

    array_of_lines = FileParser.new(text, file_name).parse_file

    array_of_lines
  end
end