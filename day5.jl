d = readlines("day5_input.txt")

## separate into two data structures using the empty row as identifer
empty_row_index = findfirst(isequal(""), d)
ordering_rules = d[1:empty_row_index - 1]
updates_raw = d[empty_row_index + 1:end]

## create a dictionary for the ordering_rules
ordering_rules_Dict = Dict{Int, Vector{Int}}()

for rule in ordering_rules
    temp = parse.(Int, split(rule, "|"))
    if haskey(ordering_rules_Dict, temp[1])
        push!(ordering_rules_Dict[temp[1]], temp[2])
    else
        ordering_rules_Dict[temp[1]] = [temp[2]]
    end
end

## convert update to integer vector of vectors
updates = Vector{Vector{Int}}()

for u in 1:length(updates_raw)

    push!(updates, parse.(Int, split(updates_raw[u], ",")))
end

## check if updates follow ordering rules

function is_update_valid(key, update, dictionary)
    allowed_values = get(dictionary, key, [])

    return all(v -> v in allowed_values, update)
end


# Part A

## initilize vector that keeps track if the update is valid
update_good = []

## loop through each update 
for u in 1:length(updates)
    
    ## subset updates to single update
    update = updates[u]

    ## initilize vector that keeps track if every entry within an update is valid
    validity = []

## loop through every entry in the update (excpet the last one) and check if it follows the ordering rules
    for i in 1:(length(update) - 1)
    push!(validity, is_update_valid(update[i], update[i + 1:length(update)], ordering_rules_Dict))
    end

    ## if all entries valid set to 1
    if all(validity) == true    

        push!(update_good, 1)
     ## not valid set to 0    
    else

        push!(update_good, 0)
    end

end

## filter for valid updates
filtered_updates = [updates[i] for i in 1:length(update_good) if update_good[i] == 1]

result = 0

for i in 1:length(filtered_updates)

    ## subset to focal update
    focal_update = filtered_updates[i]
    ## get mid most value (conditional on the assumption that vector has an odd number)
    mid_index = div(length(focal_update), 2) + 1
    ## add mid most value to result
    result += focal_update[mid_index]

end

println(result)


# Part B

## function to validate and reorder an update
function reorder_update(update, dictionary)
    # try reordering until valid or confirmed impossible
    max_attempts = length(update) * 2  # set a resonable max attempts to avoid infinite loops
    attempts = 0 # keep track of attempts

    while attempts < max_attempts
        valid_order = true
        for i in 1:(length(update) - 1)
            if !is_update_valid(update[i], update[i+1:end], dictionary)
                # swap invalid entries
                update[i], update[i+1] = update[i+1], update[i]
                valid_order = false
            end
        end

        if valid_order
            return update
        end

        attempts += 1  # update reordering attempt counts after one reordering iteration
    end

    # return nothing if reordering fails
    return nothing
end


## filter for non valid updates
updatesB = [updates[i] for i in 1:length(update_good) if update_good[i] == 0]

## initialize vector to store reordered updates
updatesB_reordered = []

## reorder all invalid updates using above defined function
for update in updatesB
    reordered = reorder_update(update, ordering_rules_Dict)
    if reordered !== nothing
        push!(updatesB_reordered, reordered)
    end
end

## calculate checksum for reordered items
result = 0
for i in 1:length(updatesB_reordered)

    ## subset to focal update
    focal_update = updatesB_reordered[i]
    ## get mid most value (conditional on the assumption that vector has an odd number)
    mid_index = div(length(focal_update), 2) + 1
    ## add mid most value to result
    result += focal_update[mid_index]

end
println(result)

