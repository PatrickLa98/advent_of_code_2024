d = readlines("day9_input.txt")
d = parse.(Int, collect(d[1]))
## split data in files and free space depending on even or odd index
files = [d[i] for i in 1:2:length(d)]
free_space =  [d[i] for i in 2:2:length(d)]

# CREATE THE RAW FILESYSTEM WITH GAPS

## initialize filesystem
filesystem = Int[]

## initilize index for files and free space that is updated withinloop
pos_files = 1
pos_free_space = 1

## start with entering a file
file = true

## initialize id number
i = 0

## loop trough files and gaps and fill up the filesystem
while pos_files != length(files) + 1

    if file
        append!(filesystem, repeat([i], files[pos_files]))  # append new entry to filesystem
        pos_files += 1 # update position in the files vector
        file = false # change to adding the free space next
        i += 1 # update id number

    else 
        append!(filesystem, repeat([-1], free_space[pos_free_space])) ## -1 is just a filler to distinguish but still keep an integer structure
        pos_free_space += 1 # update position in free space vector
        file = true # change to adding the file next
    end


end


# ORDER FILESYSTEM

still_gaps = true
while still_gaps

    focal_gap = findfirst(x -> x == -1, filesystem)
    focal_file = findlast(x -> x != -1, filesystem)

    filesystem[focal_gap], filesystem[focal_file] = filesystem[focal_file], filesystem[focal_gap]


    ## check if there are still files after the first occuring free space 

    still_gaps = any(x -> x != -1, filesystem[findfirst(filesystem .== -1) + 1:end])


end


# CALCULATE THE CHECKSUM

## remove freespaces now

filesystem_clean = filter(x -> x != -1, filesystem)

## id number starts at 0
ID_number = 0
result = []

for i in 1:length(filesystem_clean)

   ## multiply id with entry in filesystem and push to results
    push!(result, ID_number * filesystem_clean[i])

    ## update id number
    ID_number += 1

end

sum(result)

