class ArraySorter

  def initialize(array_of_lines)
    @array_of_lines = array_of_lines
  end

  def sort_lines(order)
    array_of_lines = @array_of_lines
    first_word = word_for_letter(order[0]) || "filename"
    second_word = word_for_letter(order[1])  || "filename"
    third_word = word_for_letter(order[2])  || "filename"

    array_of_lines.sort_by { |line_object| [line_object[first_word].downcase, line_object[second_word].downcase, line_object[third_word].downcase] }
  end

  def word_for_letter(letter)
    if letter == "k"
      "key"
    elsif letter == "v"
      "value"
    elsif letter == "f"
      "filename"
    end
  end
end