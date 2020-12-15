require './crt.rb'

file = File.read('13_input.txt').split("\n")
t    = file.first.to_i
r    = file.last.split(/x|,/).reject(&:empty?).map(&:to_i)


# PART 1

def f t, r_arr
  w = Float::INFINITY   #init starting wait
  s = nil               #init shortest route
  r_arr.each do |r|
    c = t / r           #complete trips
    l = c * r           #time of last trip
    n = l + r           #time of next trip
    if n - t < w
      w = n - t         #assigns wait to smallest wait thus far
      s = r             #assigns shortest route to current route
    end
  end
  return w, s           #returns wait time, shortest route
end

x, y = f t, r
p x * y

# PART 2

routes  = File.read('13_input.txt').lines(chomp: true)[1].split(',').map { |b| b == 'x' ? nil : b.to_i }
m       = []
rs      = []
routes.each_with_index do |r, idx|
  next if r.nil?
  m.push r
  rs.push((-1 * idx) % r)
end

p c_r m, rs
