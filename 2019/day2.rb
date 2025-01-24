
INPUT_FILE = "details/day2.txt"

def analyze(index1, index2, lst)
    idx = 0
    current_position = 0

    lst[1] = index1
    lst[2] = index2

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
            break

        end
        idx += 4
    end
    val = lst[0]
    return val
end

def main
    target = 19690720
    found = false
    
    file = File.open(INPUT_FILE, 'r')
    lst =  file.each_line.first.split(',').map(&:to_i)
    file.close
    
    idx1 = 12
    idx2 = 1
    result = analyze(idx1, idx2, lst.dup)
    puts "Part 1 = #{result}"

    max_len = lst.length
    for i in 1..max_len - 1
        for j in 1..max_len - 1
            result = analyze(i, j, lst.dup) 
            if result == target
                result = 100 * i + j
                puts "Part 2 = #{result}"
                found = true
                break
            end
        end
        if found == true
            break
        end
    end

end


main