def sub_number(line)
  digit_to_number = {
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine"
  }

  number_to_digit = digit_to_number.invert

  leftmost = (number_to_digit.keys + digit_to_number.keys).map do |key|
    { key:, index: line.index(key.to_s) }
  end
    .select { |match| !match[:index].nil? }
    .min_by { |match| match[:index] }

  rightmost = (number_to_digit.keys + digit_to_number.keys).map do |key|
    { key:, index: line.rindex(key.to_s) }
  end
    .select { |match| !match[:index].nil? }
    .max_by { |match| match[:index] }

  left_digit = if leftmost[:key].is_a?(String)
                 number_to_digit[leftmost[:key]]
               else
                 leftmost[:key]
               end

  right_digit = if rightmost[:key].is_a?(String)
                  number_to_digit[rightmost[:key]]
                else
                  rightmost[:key]
                end

  "#{left_digit}#{right_digit}".to_i
end

File.read("input.txt").lines.map do |line|
  sub_number(line)
end
  .sum
