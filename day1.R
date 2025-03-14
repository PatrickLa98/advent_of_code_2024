rm(list = ls())

d = read.delim("/Users/patricklauer/Documents/GitHub/advent_of_code_2024/day1_input.txt", sep ="", header = FALSE)

## PARTA
list1 = sort(d$V1)
list2 = sort(d$V2)

difference = abs(list1 - list2)

sum(difference)


## PART B
similarity = 0

for (i in 1:length(list1)) {
  
 similarity = similarity + list1[i] * sum(list2 == list1[i])
  
}

