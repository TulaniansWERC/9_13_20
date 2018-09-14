# If you are having trouble reading this text, make sure to enable soft-wrapping in your options. 
# To do this, open the "Tools" menu above and select "Global Options". 
# In options, select the "Code" panel and check the box marked "Soft-wrap R source files" and apply.

# Welcome to R! This line is a "comment", denoted by the "#" symbol at the beginning of the line. Comments do not execute commands, they are here to clarify how the code works.

# The R workflow takes place in a "script", like the file you are reading right now, and in the "console", which should also currently be open on your display. Commands entered into the console will execute immediately, whereas scripts allow us to enter multiple commands that are then executed in order when we run the script. Scripts are like magic spells, that use multiple commands that build on each other to create amazing outputs that can solve our problems for us. Any code you want to save or repeat should be in a script. 

# R as a caluculator --------------------------------------------------------------------------

# At its heart, R is just a fancy calculator. See for yourself! You can run the code below in this script, or enter them yourself in your console and hit enter. 

# To advance a script, place your cursor above the line you want to run and then press the "Run" button above, or use the keyboard command "Ctrl + Enter" (Windows) or "Cmd + Enter" (Mac). This will advance the script line by line.

x <- 15

x + 5

# What we've done above is assign the value of 15 to the variable "x". If you look in your "environment" tab, you will see that your new variable is now saved. We typically refer to things saved in our environment as "objects" in R. The "<-" is used to assign values to objects.

# The second line then recalls the value of x, and adds the value of 5 to it. You should see the output of this command in your console window. Note how the output of the second line is not saved to our environment, because we have not assigned it to an object.

# The output of an operation can also be assigned to an object:

y <- (x + 1) / (4 * 2)

z <- x + y

# This allows us to easily keep track of values we want to be able to recall later. Take some time to play with R as a calculator in your console if you are working on your own.


# Importing data into R -----------------------------------------------------------------------

# By realizing that R is really just a very fancy calculator, you already understand that R is is not that mysterious or scary to use. So let's stop wasting time and do some science! Your data is most likely saved as an excel file, and can be imported like this:

Patens <- read.csv("Patens.csv")

# Note how the data was assigned to an object that is now in your environment. 

# Open the Patens object in your environment by clicking on it. This is a special object containing multiple columns of data, we call this object a "data frame". Most scientific data that we are interested in analysing is organized like this, and manipulating data frames is likely the most useful skill you will learn in R. But that lesson is for another day!

# Let's import a second data frame.

Alterniflora <- read.csv("Alterniflora.csv")

# Visualizing data in R -----------------------------------------------------------------------

# Now that we have our data, let's look to see if there is anything interesting about it. The data represents the locations of two plant species, patens and alterniflora, and the environmental conditions associated with where they occur. Let's look at the salinity of the areas where they occur by generating some histograms.

hist(Alterniflora$Salinity)

hist(Patens$Salinity)

# The "hist" command makes a histogram, and then we specify the Smean column of the data frame using "$". The resultant histograms should appear in your "Plots" tab. 

# Looking at this data, it appears that alterniflora occurs across a wide variety of salinity conditions, whereas patens mostly occurs where salinity is low. 

# To further visualize the data, let's combine these data frames.

Plants <- rbind(Alterniflora,Patens)

# The "rbind" command can be used to stack data frames with identical columns. We created a new object called "Plants" that contains all of the values from both Patens and Alterniflora. 

#Let's use boxplots to compare the conditions that these species occur in.

boxplot(Salinity~Species, data=Plants, ylab="Salinity")
boxplot(WaterLevel~Species, data=Plants, ylab="Water Level")

# The boxplot command allows us to look at the distribution of environmental values for each species in the data. All of the plots you have generated are in the plots tab, and you can switch between them using the arrow buttons in the plots window.

# It looks like these species occur in environments with different levels of salinity, but not different water levels.


# Asking R for help ---------------------------------------------------------------------------

# The code for generating a histogram and the code for generating a boxplot are not the same, and it's not always easy to guess how you have to input a command to get the result you want. If you ever forget how to use a command, you can ask R for help using "?". Let's try generating another kind of plot now, by asking R how to do it. We would like to make a scatter plot looking at the relationship between alterniflora cover and salinity.

?plot

# Your help tab should have automatically opened and shown a document explaining how to use the "plot" command. According to the help file, we can make plots using the syntax "plot(x value, y value)". 

plot(Alterniflora$Salinity,Alterniflora$Cover)

# Note again the use of the "$" to specify a column of the data frame.

# In order to ask R for help, you have to know the name of the command you need help with. If you don't know what command you need, try google! I use google to search for how to do something every time I use R!


# Analysing Data in R -------------------------------------------------------------------------

# Let's find out if the difference in environmental conditions we observed are statistically significant. To compare two means, we will use a t-test.

t.test(Salinity ~ Species, data=Plants)

t.test(WaterLevel ~ Species, data=Plants)

# The output of this command will appear in your console and give you the p-value of the test.

# You can alternatively achieve the same result with different syntax. There are many ways to achieve the same result in R. The following command will generate the same output as the previous t.test. 

t.test(Alterniflora$Salinity, Patens$Salinity)

# We can also test the linear relationship from our scatterplot using a regression.

Regression <- lm(Alterniflora$Cover ~ Alterniflora$Salinity)

summary(Regression)

# When performaing regressions, we have to save the output to an object. We then use the "summary" command to get the output of the regression. 

# Let's revisit our scatterplot now and fit a regression line to the data.

plot(Alterniflora$Salinity,Alterniflora$Cover)
abline(lm(Alterniflora$Cover ~ Alterniflora$Salinity))

# The abline command works on top of a previously generated plot. It can interpret the output of a linear model, as we have done here, or you can specify an intercept and a slope. To see how to do this, try calling R for help ("?abline"). 

# Exporting data from R -----------------------------------------------------------------------

# We may want to export the data we've modified in R back to excel so we can share it with other people who are not using R. Doing this is very simple! Let's save our combined data frame.

write.csv(Plants, "Plants.csv")

# First we specify the object we want to save, then we supply the file name we want to save it under.

# Congratulations! You have successfully used the R programming language to import scientific data, visualize trends and test a hypothesis. You may collect your PhD at the door! At our next TURF  meeting you will be putting these skills to work on a few scenarios we design for you. Thanks for following along.