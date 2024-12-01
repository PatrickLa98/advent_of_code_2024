using DelimitedFiles

## read in data
d = readdlm("day1_input.txt", Int)

# PART A 
## sort data by int value by column
d_sorted = sort(d, dims = 1)
## calculate absolute differences between column
diff = abs.(d_sorted[:, 1] - d_sorted[:, 2])
## sum up differences
sum(diff)

# PART B
## initialize similarity with zero
similarity_score = Int[0]
## loop through all entries in the first column
for i in 1:length(d[:,1])
    ## calculate the number of times the ith entry of the first column appears in the second
    times = sum(d[i,1] .== d[:,2])
    ## update similarity score
    similarity_score = similarity_score + Int[d[i,1] * times]
end
print(similarity_score)