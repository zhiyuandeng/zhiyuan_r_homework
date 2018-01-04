# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R
load(file = "data.RData")
# 2. Peek at the top few rows
head(data)
# 3. Peek at the top few rows for only a few columns
head(data[3:5])
# 4. How many rows does your data have?
nrow(data)
# 5. Get a summary for every column
summary(data)
# 6. Get a summary for one column
summary(data$education)
# 7. Are any of the columns giving you unexpected values?

# I think numbers in the first column are labels, but it seems that R does not treat them as such.

# 8. Select a few key columns, make a vector of the column names
data.rows <- 1:21638
sex <- data$sex
education <- data$education
vocabulary <- data$vocabulary
# 9. Create a new data.frame with just that subset of columns
sex.edu.vocab <- data[data.rows, 3:5]
# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from the previous step
first.10.rows <- head(sex.edu.vocab, n = 10)
last.10.rows <- tail(sex.edu.vocab, n = 10)
# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample
sample.data <- data[sample(data.rows,nrow(data)/2),1:5]
sample.data
# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison
rows.2004 <- 1:1438
rows.2000 <- 1439:2749
edu.2004 <- data[rows.2004, "education"]
edu.2000 <- data[rows.2000, "education"]
t.test(edu.2004,edu.2000)
edu.ttest1 <- t.test(edu.2004,edu.2000)
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
t.test(edu.2004,edu.2000, var.equal = TRUE) # not possible for paired t-test
edu.ttest2 <- t.test(edu.2004,edu.2000, var.equal = TRUE)
#     - run the t.test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it
# I don't fully understand the above two questions. Could you please talk about it tomorrow during the review?

# 13. Repeat #12 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise
vocab.2004 <- data[rows.2004, "vocabulary"]
vocab.2000 <- data[rows.2000, "vocabulary"]
t.test(vocab.2004, vocab.2000)
vocab.ttest1 <- t.test(vocab.2004, vocab.2000)
t.test(vocab.2004, vocab.2000, var.equal = TRUE)
vocab.ttest2 <- t.test(vocab.2004, vocab.2000, var.equal = TRUE)

cor(data$education, data$vocabulary, method = "pearson")
edu.vocab.cor1 <- cor(data$education, data$vocabulary, method = "pearson")
cor(data$education, data$vocabulary, method = "spearman")
edu.vocab.cor2 <- cor(data$education, data$vocabulary, method = "spearman")
# 14. Save all results from #12 and #13 in an .RData file
save(edu.ttest1, edu.ttest2, vocab.ttest1, vocab.ttest2, edu.vocab.cor1, edu.vocab.cor2, file = "results_day02.RData")
# 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link


