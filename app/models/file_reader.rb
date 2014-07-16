
class FileReader

  def initialize
    #TODO: put in dot env!!! don't commit the secret keys!!!

    connection = Fog::Storage.new({
                                    :provider                 => 'AWS',
                                    :aws_access_key_id        => ENV['AWS_ACCESS_KEY_ID'],
                                    :aws_secret_access_key    => ENV['AWS_SECRET_ACCESS_KEY']
                                  })

    object = connection.get_object('conspire-challenge', 'claims_to_fame.txt')
    @file_name = 'claims_to_fame.txt'
    @text = object.body
  end

  def to_hash(sort='fkv')
    array_of_lines = FileParser.new(@text, @file_name).parse_file

    sort = 'fkv' if sort.nil?
    sorted_array_of_lines = ArraySorter.new(array_of_lines).sort_lines(sort)
    sorted_array_of_lines
  end

end