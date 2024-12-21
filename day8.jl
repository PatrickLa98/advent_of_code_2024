#=
1. read and format data
2. write helper functions
    2.1 checking of antinode in bounds of grid
    2.2 getting the row (y) and column (x) location of antinode
3. loop through grid and get the locations of any digit other than . 
4.  check all combinations of digits with the same frequency for a antinode in bounds of grid using helper functions defined in 2
5. sum up all unique inbound locations of antinodes
=#

## 1. read and format data
d = readlines("day8_input.txt")
d = [collect(line) for line in d]

## define bounds of the mapped area (square so only one max def needed)
max_n = length(d[:][1])

## 2. write helper functions

    ## 2.1 checking if antinode is in bounds of grid
    function in_bounds(x, y)
        return 0 < x <= max_n && 0 < y <= max_n
    end

    ## 2.2 get the row y and column x location of antinode
    function antinode_loc()