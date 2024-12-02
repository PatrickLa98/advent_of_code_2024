## read in data as vector of vectors (because of varying level length)
d = readlines("day2_input.txt")
d = [parse.(Int, split(line)) for line in d]

# PART A

## initialize safe vector used to keep track of safe levels
safe = 0

## loop through different reports
for i in 1:length(d)
    ## calculate differences between adjacent levels
    differences = diff(d[i])

    ## check if levels are all either decreasing or increasing
    if all(differences .< 0) || all(differences .> 0)

        ## check if adjacent levels differ at least by 1 and at most by 3 
        if all(abs.(differences) .> 0) && all(abs.(differences) .< 4) 
            ## if conditions are fullfilled increase safe counter by 1
            safe += 1
        end

    end
end
println(safe)

# PART B
## initialize safe vector used to keep track of safe levels
safe = 0

## loop through reports
for i in 1:length(d)
    ## subset by report
    sub = deepcopy(d[i])
    ## calculate differences between adjacent levels
    differences = diff(sub)

  ## check if levels are all either decreasing or increasing
  if all(differences .< 0) || all(differences .> 0)
    ## check if adjacent levels differ by at least 1 and at most by 3
    if all(abs.(differences) .> 0) && all(abs.(differences) .< 4)
        safe += 1
        continue # move to next iteration 
    end
  end
  
  ## problem dampener            
  is_safe = false
  for j in 1:length(sub)
      ## remove one level at at time and recalculate differences
      temp_sub = deleteat!(deepcopy(sub), j)
      temp_differences = diff(temp_sub)

      ## check if levels are all either decreasing or increasing
      if all(temp_differences .< 0) || all(temp_differences .> 0)
          ## check if adjacent levels differ by at least 1 and at most by 3
          if all(abs.(temp_differences) .> 0) && all(abs.(temp_differences) .< 4)
              is_safe = true
              break # stop iterating when a safe option is found
          end
      end
  end

  ## update count when report is considered safe after removing 1 entry
  if is_safe
      safe += 1
  end            
     
end                    

println(safe)   