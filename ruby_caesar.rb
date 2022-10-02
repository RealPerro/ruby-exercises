def caesar_cipher(string, shift_number)
  return string if shift_number == 0

  shift_number = shift_number % 26

  temp_array = string.split('')
  temp_array.map! { |c| wrap_char(c.ord, shift_number).chr }

  p temp_array.join('')
  temp_array.join('')
end

def wrap_char(number, shift_number)
  range_start = 0
  range_end = 1000

  low = [97, 122]
  high = [65, 90]

  new_number = number + shift_number

  # clasify as uppercase, lowercase or other (in other case return unchanged)
  if number.between?(low[0], low[1])
    range_start = low[0]
    range_end = low[1]

  elsif number.between?(high[0], high[1])
    range_start = high[0]
    range_end = high[1]

  else
    return number

  end

  range = range_end - range_start

  if new_number < range_start
    # puts "<"
    range_end - (range_start - new_number) % range + 1

  elsif new_number > range_end
    # puts ">"
    range_start + (new_number - range_end) % range - 1

  elsif new_number.between?(range_start, range_end)
    # puts "="
    new_number

  else
    # puts "rest"
    'ERROR'

  end
end

caesar_cipher('What a string!', 26)
