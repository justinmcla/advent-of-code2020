require 'set'

file  = File.read('8_input.txt').split("\n")
ops   = file.map { |op| op.split(' ') }
ops   = ops.map { |op| [op.first, op.last.to_i] }

def run_program ops, part: 1
  acc = 0
  i   = 0
  ran = Set.new

  loop do
    break if ran.include? i
    break if i == ops.count

    op, arg = ops[i]
    ran << i

    case op
    when 'acc'
      acc += arg; i += 1
    when 'jmp'
      i += arg
    when 'nop'
      i += 1
    end
  end

  return acc if part == 1
  i == ops.count ? acc : nil
end

p run_program ops

ops.count.times do |i|
  new_ops = ops.dup
  op, arg = ops[i]
  next if op == 'acc'

  if op == 'jmp'
    new_ops[i] = ['nop', arg]
  else
    new_ops[i] = ['jmp', arg]
  end

  val = run_program new_ops, part: 2
  if val
    p val
    break
  end
end
