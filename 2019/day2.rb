
INPUT_FILE = "details/day2.txt"

# 3749
def main
    idx = 0
    current_position = 0
    done = false
    
    file = File.open(INPUT_FILE, 'r')
    lst =  file.each_line.first.split(',').map(&:to_i)
    file.close
  
    lst[1] = 12
    lst[2] = 2
    while current_position != 99

        if lst[idx] == 1
            current_position = idx

            position1 = lst[idx + 1]
            position2 = lst[idx + 2]
            result_location = lst[idx + 3]

            val1 = lst[position1]
            val2 = lst[position2]

            result = val1 + val2
            lst[result_location] = result
        
        elsif lst[idx] == 2
            position1 = lst[idx + 1]
            position2 = lst[idx + 2]
            result_location = lst[idx + 3]
            
            val1 = lst[position1]
            val2 = lst[position2]

            result = val1 * val2
            lst[result_location] = result


        elsif lst[idx] == 99
            done = true
            break

        end
        idx += 4
    end
    puts lst[0]
end


main