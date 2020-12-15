actions = File.read('12_input.txt').lines(chomp: true)

c_dir = 'E'
c_pos = [0, 0]

actions.each do |a|
  dir  = a[0] == 'F' ? c_dir : a[0]
  size = a[1..].to_i

  case dir
  when 'N' then c_pos[1] += size
  when 'S' then c_pos[1] -= size
  when 'E' then c_pos[0] += size
  when 'W' then c_pos[0] -= size
  when 'L'
    o = ['N', 'W', 'S', 'E']
    c_dir = o[(o.index(c_dir) + size / 90) % o.size]
  when 'R'
    o = ['N', 'E', 'S', 'W']
    c_dir = o[(o.index(c_dir) + size / 90) % o.size]
  end
end

p c_pos.map(&:abs).sum

c_pos = [0, 0]
w_off = [10, 1]

actions.each do |a|
  dir  = a[0]
  size = a[1..].to_i

  case dir
  when 'N' then w_off[1] += size
  when 'S' then w_off[1] -= size
  when 'E' then w_off[0] += size
  when 'W' then w_off[0] -= size
  when 'L'
    case size
    when 90  then w_off = [ -1 * w_off[1], w_off[0] ]
    when 180 then w_off = [ -1 * w_off[0], -1 * w_off[1] ]
    when 270 then w_off = [ w_off[1], -1 * w_off[0] ]
    end
  when 'R'
    case size
    when 90  then w_off = [ w_off[1], -1 * w_off[0] ]
    when 180 then w_off = [ -1 * w_off[0], -1 * w_off[1] ]
    when 270 then w_off = [ -1 * w_off[1], w_off[0] ]
    end
  when 'F' then c_pos = [ c_pos[0] + w_off[0] * size, c_pos[1] + w_off[1] * size ]
  end
end

puts c_pos.map(&:abs).sum
