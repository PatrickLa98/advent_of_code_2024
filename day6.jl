
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
for r in 1:rows
    for c in 1:columns

        if d[r][c] == '^'
            location = [r,c]
         break
        end

    end
end

location


## move and check for # on the way

while d[location[1]][location[2]] != '#' && location[1] <= rows && location[2] <= columns && location[1] > 0 && location[2] > 0 ## need to change to location - direction like this it updates to the stopper

  location =  location .+ direction

end

## update movement direction

direction = rot_90 * direction 
