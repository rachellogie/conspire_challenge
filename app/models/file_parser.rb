class FileParser

  def initialize(input, file_name)
    @input = input
    @file_name = file_name
  end

  def parse_file
    lines_array = []
    @input.each_line do |line|
      key, value = line.split("\t")
      lines_array << {
        'filename' => @file_name,
        'key' => key.strip,
        'value' => value.strip,
      }
    end
    lines_array
  end
end