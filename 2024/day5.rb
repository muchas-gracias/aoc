INPUT_FILE = "details/day5_input.txt"

class PrintQueue
  attr_accessor :parameters, :lines

  def initialize(parameters, lines)
    @parameters = parameters
    @lines = lines
    @test = []
    @part1_total = 0
    @part2_total = 0
  end

  def get_middle_value(lst, part)
    length = lst.length
    index_pos = 0

    if length.even?
    index_pos = (lenght / 2) - 1
    else
      index_pos = (length - 1) / 2
    end

    if part == 1
      @part1_total += lst[index_pos].to_i

    else

      @part2_total += lst[index_pos].to_i
    end

  end

  def organize(lst)
    update = false
    count = 0

    while count < 10
      @test.each do |t|
        low = t[0]
        high = t[1]

        idx1 = lst.index(low)
        idx2 = lst.index(high)

        if idx1 > idx2
          update = true
          lst.delete_at(idx1)
          lst.delete_at(idx2)
          lst.insert(idx2, low)
          lst.insert(idx1, high)
        end
      end

      count += 1
    end

    if update
      get_middle_value(lst, 1)

    else
      get_middle_value(lst, 2)

    end

  end

  def start
    @lines.each do |line|
      @parameters.each do |param|

        if line.include?(param[0]) && line.include?(param[1])
          @test << [param[0], param[1]]
        end
      end

      organize(line)
      @test.clear

    end
    puts "Part 1 total = #@part1_total"
    puts "Part 2 total = #@part2_total"
  end

end

def main

  content = File.read(INPUT_FILE)

  parameters, lines = content.strip.split("\n\n")
  parameters_lst = parameters.split("\n").map { |line| line.split('|') }
  lines_lst = lines.split("\n").map { |line| line.split(',') }

  queue = PrintQueue.new(parameters_lst, lines_lst)
  queue.start

end


main