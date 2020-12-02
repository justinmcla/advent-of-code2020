# 1-3 a: abcde
# min: 1
# max: 3
# char: a
# pass: abcde

all_passwords = []
File.foreach("2_input.txt") do |line|
  line_data = line.split(' ')
  all_passwords.push({
    min:            line_data[0].split('-')[0].to_i,
    max:            line_data[0].split('-')[1].to_i,
    required_char:  line_data[1].chop,
    password:       line_data[2]
    })
end

def check_password(hash)
  password  = hash[:password]
  min       = hash[:min]
  max       = hash[:max]
  char      = hash[:required_char]

  min <= password.count(char) &&
  password.count(char) <= max
end

valid_passwords = all_passwords.select { |pass_hash| check_password(pass_hash) }
puts valid_passwords.count

def check_password_new(hash)
  password  = hash[:password]
  first     = hash[:min] - 1
  second    = hash[:max] - 1
  char      = hash[:required_char]

  (password[first] == char && password[second] != char) ||
  (password[first] != char && password[second] == char)
end

valid_passwords = all_passwords.select { |pass_hash| check_password_new(pass_hash) }
puts valid_passwords.count
