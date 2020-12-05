file = File.read('5_input.txt').split("\n")

def calculate_seat_id(boarding_pass_string)
  rows = Range.new(0, 127)
  cols = Range.new(0, 7)
  i    = 0
  while i < 7
    rows = boarding_pass_string[i] == 'F' ? rows.first(rows.size / 2) : rows.last(rows.size / 2)
    i += 1
  end
  while i >= 7 && i < 10
    cols = boarding_pass_string[i] == 'L' ? cols.first(cols.size / 2) : cols.last(cols.size / 2)
    i += 1
  end
  seat_id = rows[0] * 8 + cols[0]
end

seat_ids    = file.map { |boarding_pass| calculate_seat_id(boarding_pass) }.sort
my_seat_id  = 0

i = 0
while i < seat_ids.length
  my_seat_id = seat_ids[i] + 1 if seat_ids[i + 1] != seat_ids[i] + 1
  break if my_seat_id != 0
  i += 1
end

p my_seat_id
