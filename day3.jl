d = read("day3_input.txt",String)
d

## define correct pattern using regular expressions
correct_pattern =  r"mul\((\d+),(\d+)\)"

# PART A

## identify correct patterns in data
matches = eachmatch(correct_pattern, d)
#collect(matches)

## initialize result object
result = 0
## loop throgh matches and add up multiplied matches
for m in matches
    x = parse(Int, m.captures[1])  # convert weird string object to integer
    y = parse(Int, m.captures[2])  # convert weird string object to integer
    result  += x * y # multiply and add to results
end
result


# PART B
