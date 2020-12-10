d = File.read('9_input.txt').split("\n").map(&:to_i)

# PART 1

i = 25

loop do

  break if i == d.size

  f = i - 25
  s = d[f..i]
  o = []

  s.each do |n|
    s.each do |q|
      o << n + q unless n == q
    end
  end

  p d[i] unless o.include? d[i]

  i += 1

end

# PART 2

t = 257342611

while true

  c = 0
  l = nil
  d.each_with_index do |n, i|
    c += n
    if c == t
      l = i
      break
    end
    break if c > t
  end

  if l != nil
    r = d[0..l]
    p r.min + r.max
    exit
  end

  d.shift
end
