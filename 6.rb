# loads input file & removes newline at end
file      = File.read('6_input.txt').split("\n\n")
file[file.length - 1] = file.last.chomp

responses = file.map { |group| group.split("") }

def count_resp(response)
  all_res   = []
  pass_res  = []
  size      = response.count("\n") + 1

  response.reject{ |e| e == "\n" }.each do |res|
    if !all_res.include? res
      all_res << res
      pass_res << res if response.count(res) == size
    end
  end
  pass_res.size
end

pos = 0
responses.each { |res| pos += count_resp(res) }
p pos
