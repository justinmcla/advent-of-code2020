forest_map = []

File.foreach('3_input.txt') do |line|
  forest_map.push(line.slice(0, line.length - 1))
end

def tree_checker(forest_map, right_int, down_int)
  pos_x       = 0
  pos_y       = 0
  tree_count  = 0

  forest_map.each do |row|
    next unless forest_map.index(row) == pos_y
    tree_count += 1 if row[pos_x] == '#'
    pos_x += right_int
    pos_x = pos_x - row.length if pos_x >= row.length
    pos_y += down_int
  end

  tree_count
end

simple_slopes     = [1, 3, 5, 7]
simple_tree_count = 1

simple_slopes.each { |slope| simple_tree_count *= tree_checker(forest_map, slope, 1) }
p simple_tree_count *= tree_checker(forest_map, 1, 2)
