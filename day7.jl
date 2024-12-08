
## read in data
d = readlines("day7_input.txt")

## initialize storage vecotrs
solutions = Int[]
values = []

## split data in solution vector and in values vector of vectors
for i in 1:length(d)

    solution, value =   split(d[i], ": ")
    value = parse.(Int, split(value, " "))

    push!(solutions, parse(Int,solution))
    push!(values, value)
end

# PART A

## recursive function to find a correct solution of equation
function find_correct_solution(values, solution, focal_index = 1, focal_value = focal_values[1])

    ## if done iterating check if solution is correct
    if focal_index == length(focal_values)

        return focal_value == solution
    end

    ## update iteration
    next_index = focal_index + 1
   
    ## Recursion with alternative + or * operator
    return find_correct_solution(focal_values, solution, next_index, focal_value + focal_values[next_index]) ||
           find_correct_solution(focal_values, solution, next_index, focal_value * focal_values[next_index])

end

## initialize results
result = 0

## loop through equations, find correct solutions using the above defined function and add up the solutions of the correct equations
for j in 1:length(solutions)

    focal_values = values[j]
    solution = solutions[j]

   if find_correct_solution(focal_values, solution)

        result += solutions[j]
   end
end

result


# PART B
