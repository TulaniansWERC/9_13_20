#modified from: https://chrisalbon.com/r-stats/password-generator.html

library(stringr)

#define punctuation vector
punct <- strsplit(intToUtf8(c(33:47, 58:64, 91:96)), "")[[1]]

#chase bank uses a restricted set of characters
punct.chase <- punct[c(1,3,4,5,11,15,19,22)]
punct.capitalone <-  c("-", "_", ".", "/", "!", "#", "$", "%", "*", "&", "@")
punct.amex <- c("%", "&", "_", "?", "#", "=", "-")
punct.ATT <- c("_", "-")
  
# enter the url here:
url <- "123456789101"

# password generating function
password <- function(x)
{
  length <- 24 # take length of url minus a random five digit number
  random.string <- paste(sample(c(0:9, letters, LETTERS, punct.capitalone), length, replace=TRUE), collapse="") # for that vector add random upper and lower case numbers, with replacement of length "length"
  return(random.string) # display the created string
}

# generate 4 possible passwords
rep(password(url), 4)



