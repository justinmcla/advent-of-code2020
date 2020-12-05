require './4_validation'

file = File.read('4_input.txt').split("\n\n")
passports = file.map { |data| data.split("\n").join(" ").split(" ") }

formatted_passports = passports.map do |passport|
  formatted = {}
  passport.each do |pair|
    pair = pair.split(':')
    formatted[pair[0]] = pair[1]
  end
  formatted
end

required_fields = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid']
valid_passports = formatted_passports.select do |passport|
  required_fields.all? { |field| passport.include? field }
end

p valid_passports.count
p valid_passports.select { |p| validate_passport(p) }.count
