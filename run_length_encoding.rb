require 'pry'

class RunLengthEncoding
  def self.final_char!(char, index, char_array, count, encoded_data)
    if char == char_array[index - 1]
      count += 1
      encoded_data << count.to_s if count != 1
    else
      encoded_data << count.to_s if count != 1
      encoded_data << char_array[index - 1]
    end
    encoded_data << char
  end

  def self.encode(input)
    char_array = input.chars
    count = 1
    encoded_data = ''

    char_array.each_with_index do |char, index|
      next if index == 0

      if index == char_array.size - 1
        final_char!(char, index, char_array, count, encoded_data)
      elsif char == char_array[index - 1]
        count += 1
      else
        encoded_data << count.to_s if count != 1
        encoded_data << char_array[index - 1]
        count = 1
      end
    end

    encoded_data
  end

  def self.decode(input)
    decoded_data = ''
    char_array = input.chars
    num_flag = false
    count = 0

    char_array.each_with_index do |char, index|
      if char.to_i != 0 && num_flag == false
        num_flag = true
        count = char.to_i
      elsif char.to_i != 0 && num_flag == true
        count = (count.to_s << char).to_i
      elsif num_flag == true
        count.times do
          decoded_data << char_array[index]
        end
        num_flag = false
      else
        decoded_data << char
      end
    end

    decoded_data
  end
end
