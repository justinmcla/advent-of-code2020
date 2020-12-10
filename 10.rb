require 'set'

a = File.read('10_input.txt').split("\n").map(&:to_i).sort
a = a.unshift 0
a = a.push a.last + 3

# PART 1

d = a.each_with_index.map { |j, i| a[i + 1] - j if a[i + 1] }
x = d.count(1)
y = d.count(3)
p x * y

# PART 2

def f a, c, n
  return 1 if n == 0
  return 0 if !a.include? n
  c[n] ||= (1..3).sum { |x| f a, c, n - x }
end

p f a.to_set, {}, a.last
