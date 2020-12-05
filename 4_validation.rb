def check_year(year, min, max)
  year.length == 4 &&
  min <= year.to_i &&
  max >= year.to_i
end

def check_height(height)
  height_i = height.slice(0, height.length - 2).to_i

  if height.end_with? 'in'
    59 <= height_i && height_i <= 76
  elsif height.end_with? 'cm'
    150 <= height_i && height_i <= 193
  else
    # defaults to false in case of missing unit
    false
  end
end

def check_eye(color)
  valid_colors = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']
  valid_colors.include? color
end

def check_hair(color)
  # e.g. #f025a8
  color.match?(/^#[\da-f]{6}$/)
end

def check_pid(pid)
  # e.g. 012345678
  pid.match?(/^\d{9}$/)
end

def validate_passport(h)
  check_year(h['byr'], 1920, 2002) &&
  check_year(h['iyr'], 2010, 2020) &&
  check_year(h['eyr'], 2020, 2030) &&
  check_height(h['hgt']) &&
  check_hair(h['hcl']) &&
  check_eye(h['ecl']) &&
  check_pid(h['pid'])
end
