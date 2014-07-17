class ArraySorter

  def initialize(array_of_lines)
    @array_of_lines = array_of_lines
  end

  def sort_lines(order)
    order = complete_order(order)
    first_word, second_word, third_word = get_search_words(order)
    @array_of_lines.sort_by { |line_object| [line_object[first_word].downcase, line_object[second_word].downcase, line_object[third_word].downcase] }
  end

  private

  def complete_order(order)
    order = remove_extra_letters(order)
    order = add_letters(order) if order.length < 3
    order
  end

  def remove_extra_letters(order)
    letters = order.chomp.split("").uniq.select { |letter| letter =~ /[fkv]/}
    letters.join("")
  end

  def add_letters(order)
    order = order + "fvk"
    remove_extra_letters(order)
  end

  def get_search_words(order)
    first_word = word_for_letter(order[0])
    second_word = word_for_letter(order[1])
    third_word = word_for_letter(order[2])
    return first_word, second_word, third_word
  end

  def word_for_letter(letter)
    case letter
      when "k"
        "key"
      when "v"
        "value"
      when "f"
        "filename"
    end
  end
end