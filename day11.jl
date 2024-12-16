
d = Int[125, 17]

## helper functions

    ## counts digits in an integer
    function count_digits(n::Int)
        return length(string(abs(n))) 
    end

    ## checks if number is even 
    function is_even(n::Int)
        return n % 2 == 0
    end



function processing_stones(data, repeats)

    
       
    new_stones = Int[] 

    for j in 1:repeats
        
        if j == 1
            current_stones = deepcopy(data)
        else
            current_stones = deepcopy(new_stones)
        end  

        for i in 1:length(d)

                stone = d[i]

            if stone == 0

                stone = 1
                push!(new_stones, stone)

            elseif is_even(count_digits(stone))
                
            mid = div(count_digits(stone),2)
            stone_string = string(stone)
            stone1 = parse(Int, stone_string[1:mid])
            stone2 = parse(Int, stone_string[mid+1:end])
            push!(new_stones, stone1)
            push!(new_stones, stone2)


            else

                stone = stone * 2024
                push!(new_stones, stone)

            end

        end

    end

    return length(new_stones)

end


processing_stones(d, 6)