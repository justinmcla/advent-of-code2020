file = File.read('7_input.txt').split("\n")
file = file.map { |r| r.split(' bags contain ') }

RULES = {}

file.each do |line|
  key        = line.first.to_sym
  contents   = line.last.chomp.split(', ')
  RULES[key] = []
  contents.each do |bag|
    b = bag.match(/^(\d+) (\w+ \w+)/).to_s.split(' ', 2)
    RULES[key] << [b[1].to_sym, b[0].to_i] unless b == []
  end
end

def find_bag_options(bag_color)
  bags = {}
  RULES.keys.each { |k| bags[k] = -1 }

  counter = lambda do |opt|
    return 1 if opt == bag_color
    return 0 if RULES[opt].empty?

    count = 0

    RULES[opt].each do |o|

      if bags[o.first] < 0
        update = o[1] * counter.call(o.first)
      else
        update = bags[o.first]
      end

      bags[o.first] = update
      count += update
    end

    count

  end

  RULES.keys.select { |k| k != bag_color && counter.call(k) > 0 }
end

p find_bag_options(:"shiny gold").size

def find_total_bags(bag_color)
  counter = lambda do |opt|
    temp = RULES[opt].map do |o|
      o[1] * (1 + counter.call(o.first))
    end
    temp = temp.reduce(0, :+)
  end

  counter.call(bag_color)
end

p find_total_bags(:"shiny gold")
