
d = Int[0, 4, 4979, 24, 4356119, 914, 85734, 698829]

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

    stones = data
       
    for j in 1:repeats
        
        new_stones = Int[] 


        for i in 1:length(stones)

                stone = stones[i]

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

        stones = deepcopy(new_stones)

    end

    return length(stones)

end

## Part A
processing_stones(d, 25)




## Part B

# function used for A to slow for 75 repeats change to do the repeats of each stone seperately and only keep track of in how many stones it transfers to

function processing_stones_B(data, repeats)

    stones = data
    stone_count = 0

        for i in 1:length(stones)

                ## keep track of 1 stone and its division in more stones acrross repeats
                stone = [stones[i]]
                new_stones = Int[] 


                for j in 1:repeats

                    if j != 1
                        stone = deepcopy(new_stones)
                        new_stones = Int[] 

                    end

                    for s in 1:length(stone)

                        if stone[s] == 0

                            stone[s] = 1

                        elseif is_even(count_digits(stone[s]))
                            
                        mid = div(count_digits(stone[s]),2)
                        stone_string = string(stone[s])
                        stone1 = parse(Int, stone_string[1:mid])
                        stone2 = parse(Int, stone_string[mid+1:end])
                        push!(new_stones, stone1)
                        push!(new_stones, stone2)
            


                        else

                            push!(new_stones, stone[s]*2024)

                        end

                     end

                 end

                 stone_count += length(new_stones)

        end

    return stone_count

end


processing_stones_B(d, 25)