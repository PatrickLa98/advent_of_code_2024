
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


## Slow function that can be used for part A but not part B

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

## approach used in part A way too slow
## instead keep track of stones by counting occurences of stones in a dictionary

function processing_stones_B(data, repeats)
    ## initilize dictionary that keeps track of total stone counts
    stone_counts = Dict{Int, Int}()
    ## fill dictionary with starting stones that each occur once
    for stone in data
        stone_counts[stone] = get(stone_counts, stone, 1)
    end

    ## loop and keep track of stones through repeats
    for i in 1:repeats

        new_stones = Dict{Int, Int}()
        
        for (stone, count) in stone_counts

            if stone == 0
                
                new_stones[1] = get(new_stones, 1, 0) + count ## add stone with value 1 occuring same amount of times as 0 in prior iteration
                
            elseif is_even(count_digits(stone))
                ## divide even digit stone in middle and safe new stones and count of these new stones    
                mid = div(count_digits(stone),2)
                stone_string = string(stone)
                stone1 = parse(Int, stone_string[1:mid])
                stone2 = parse(Int, stone_string[mid+1:end])
                ## increment counts of the new stones
                new_stones[stone1] = get(new_stones, stone1, 0) + count
                new_stones[stone2] = get(new_stones, stone2, 0) + count

            else

                ## multiply by 2024 
                new_stone = stone*2024
                new_stones[new_stone] = get(new_stones, new_stone, 0) + count

            end
^
        end

        ## update the stone count after completing a repeat/blink/iteration
        stone_counts = new_stones

    end
    ## sum up stones in last iteration
    total_stones = sum(values(stone_counts))

    return total_stones

end


processing_stones_B(d, 75)