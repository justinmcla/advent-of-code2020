expenses = File.open("1_input.txt").read.split
expenses = expenses.map { |e| e.to_i }

expenses.each do |e1|
  expenses.each do |e2|
    p e1 * e2 if e1 + e2 == 2020
  end
end

expenses.each do |e1|
  expenses.each do |e2|
    expenses.each do |e3|
      p e1 * e2 * e3 if e1 + e2 + e3 == 2020
    end
  end
end
