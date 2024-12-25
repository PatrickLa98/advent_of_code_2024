using LinearAlgebra
#=
1. read and format data
2. write helper functions
    2.1 checking of antinode in bounds of grid
    2.2 getting the row (y) and column (x) location of antinode
3. loop through grid and get the locations of any digit other than '.' 
4.  check all combinations of digits with the same frequency for a antinode in bounds of grid using helper functions defined in 2
5. sum up all unique inbound locations of antinodes
=#

## 1. read and format data
d = readlines("day8_input.txt") # read in
d = [collect(line) for line in d] # create vector of vectors
d = (hcat(d...)) # transform to matrix
d = permutedims(d) # need to transpose matrix because rows in vector of vectors are treated as columns in hcat function

## define bounds of the mapped area (square so only one max def needed)
max_n = length(d[:,1])

## 2. write helper functions

    ## 2.1 checking if antinode is in bounds of grid
    function in_bounds(x, y)
        return 0 < x <= max_n && 0 < y <= max_n
    end

    ## 2.2 get the row y and column x location of antinode
    function antinode_loc(::Vector{Int64}, ::Vector{Int64})

        ## positions of antenna 1 and antenna 2
        x1, y1 = xy1
        x2, y2 = xy2

        ## positions of antinodes 1 and 2
        x3, y3 = x1 - (x2 - x1), y1 - (y2 - y1)
        x4, y4 = x2 - (x1 - x2), y2 - (y1 -y2)
 
        # check if antinode locations are in bounds
        results = []
        if in_bounds(x3, y3)
            push!(results, (x3, y3))
        end
        if in_bounds(x4, y4)
            push!(results, (x4, y4))
        end

 ## return all valid antinode locations
 return results
end

## 3. loop through grid and get the locations of any digit other than '.' 
