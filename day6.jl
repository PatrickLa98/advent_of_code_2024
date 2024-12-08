using StatsBase ##needed for countmap function

d = readlines("day6_input.txt")

d = [collect(line) for line in d]


rows = length(d[:][1])
columns = length(d[1][:])

## initialize direction
direction = [-1,0]

## define rotation matrix
rot_90 = [0 1
          -1 0]



## find starting location
location = []
for r in 1:rows
    for c in 1:columns

        if d[r][c] == '^'
            location = [r,c]
         break
        end

    end
end

## safe locations
trajectory = Vector{Vector{Int}}()

## loop through locations until it reaches the end of the mapped area
while location[1] != rows && location[2] != columns

    ## move and check for # on the way
    while ## while next location is not out of bounds and is not the stop signal
        location[1] + direction[1] <= rows && 
        location[2] + direction[2] <= columns && 
        location[1] + direction[1] > 0 &&
        location[2] + direction[2] > 0 &&
        d[location[1] + direction[1]][location[2] + direction[2]] != '#' 

    ## update location with respective direction    
    location =  location .+ direction
    ## keep track of trajectory
    push!(trajectory, location)

    end

    ## update movement direction
    direction = rot_90 * direction 

end

## count up distinct locations in movement trajectory
trajectory
countmap(map(x -> Tuple(x), trajectory))

