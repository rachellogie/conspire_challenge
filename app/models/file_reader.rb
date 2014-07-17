
class FileReader

  def initialize
    @connection = Fog::Storage.new({
                                    :provider                 => 'AWS',
                                    :aws_access_key_id        => ENV['AWS_ACCESS_KEY_ID'],
                                    :aws_secret_access_key    => ENV['AWS_SECRET_ACCESS_KEY']
                                  })
    @bucket = 'conspire-challenge'
  end

  def to_hash(sort_order)
    list_of_files = get_files_from_bucket

    all_lines = make_array_of_lines(list_of_files)

    sort_order = 'fkv' if sort_order.nil?
    ArraySorter.new(all_lines).sort_lines(sort_order)
  end

  def make_array_of_lines(list_of_files)
    array_of_lines = []
    list_of_files.each do |file|
      text = get_text(file)
      array_of_lines += FileParser.new(text, file).parse_file
    end
    array_of_lines
  end

  def get_text(file)
    object = @connection.get_object('conspire-challenge', file)
    object.body
  end

  def get_files_from_bucket
    bucket = @connection.get_bucket(@bucket)
    bucket.body["Contents"].map { |object| object["Key"] }
  end

end