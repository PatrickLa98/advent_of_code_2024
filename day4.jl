## read in data
d = readlines("day4_input.txt")
## convert to matrix structure
d = hcat([collect(row) for row in d]...)

rows = length(d[:,1])
columns = length(d[1,:])

# PART A
xmas_count = 0
for r in 1:rows

    for c in 1:columns


           ## left to right
        if c + 3 <= columns && d[r,c] == 'X' && d[r,c+1] == 'M' && d[r,c+2] == 'A' && d[r,c+3] == 'S'
            xmas_count += 1
        end
            ## right to left
        if c - 3 > 0 && d[r,c] == 'X' && d[r,c-1] == 'M' && d[r,c-2] == 'A' && d[r,c-3] == 'S' # NOTE:using independent if statements instead of elseif because same X may be part of different xmas'es
            xmas_count += 1
        end
            ## top to bottom
        if r + 3 <= rows && d[r,c] == 'X' && d[r+1,c] == 'M' && d[r+2,c] == 'A' && d[r+3,c] == 'S'
            xmas_count += 1
        end
            ## bottom to top
        if r - 3 > 0 && d[r,c] == 'X' && d[r-1,c] == 'M' && d[r-2,c] == 'A' && d[r-3,c] == 'S'
            xmas_count += 1
        end
            ## top left to bottom right
        if c + 3 <= columns && r + 3 <= rows && d[r,c] == 'X' && d[r+1,c+1] == 'M' && d[r+2,c+2] == 'A' && d[r+3,c+3] == 'S'
            xmas_count += 1
        end
            ## bottom right to top left
        if c - 3 > 0 && r - 3 > 0 && d[r,c] == 'X' && d[r-1,c-1] == 'M' && d[r-2,c-2] == 'A' && d[r-3,c-3] == 'S'
            xmas_count += 1
        end
            ## top right to bottom left
        if c - 3 > 0 && r + 3 <= rows && d[r,c] == 'X' && d[r+1,c-1] == 'M' && d[r+2,c-2] == 'A' && d[r+3,c-3] == 'S'
            xmas_count += 1
        end
            ## bottom left to top right
        if c + 3 <= columns && r - 3 > 0 && d[r,c] == 'X' && d[r-1,c+1] == 'M' && d[r-2,c+2] == 'A' && d[r-3,c+3] == 'S'
            xmas_count += 1
        end

    end
end

xmas_count

# PART B
xmas_count = 0
for r in 1:rows

    for c in 1:columns


        if c + 2 <= columns && r + 2 <= rows && d[r,c] == 'M' && d[r+1,c+1] == 'A' && d[r+2,c+2] == 'S' && d[r+2,c] == 'M' && d[r,c+2] =='S'
            xmas_count += 1
        end
        if c + 2 <= columns && r + 2 <= rows && d[r,c] == 'M' && d[r+1,c+1] == 'A' && d[r+2,c+2] == 'S' && d[r+2,c] == 'S' && d[r,c+2] =='M'
            xmas_count += 1
        end
        if c + 2 <= columns && r + 2 <= rows && d[r,c] == 'S' && d[r+1,c+1] == 'A' && d[r+2,c+2] == 'M' && d[r+2,c] == 'M' && d[r,c+2] =='S'
            xmas_count += 1
        end
        if c + 2 <= columns && r + 2 <= rows && d[r,c] == 'S' && d[r+1,c+1] == 'A' && d[r+2,c+2] == 'M' && d[r+2,c] == 'S' && d[r,c+2] =='M'
            xmas_count += 1
        end

    end
end

xmas_count