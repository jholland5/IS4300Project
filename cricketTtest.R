# An example of a two-sample t-test using the cricketer data set.

data <- read.csv("cricketer.csv")
# taken from
# https://vincentarelbundock.github.io/Rdatasets/datasets.html
str(data)
# There are 5960 rows of both living and dead cricketers.  We wish to 
# filter out those still alive.

sub1 <- data[data$dead == 1,]    # only rows with dead = 1 (dead)
str(sub1)					  # there are 3387 rows.

# We now create a vector for left handed cricketers as well as a vector
# for right handed cricketers.

left <- sub1[sub1$left=="left",4] #life-expectancy for left handers
right <- sub1[sub1$left=="right",4] #life-expectancy for right handers

length(left)			#nl=632		
length(right)			#nr=2755
length(left)+length(right)   # nl+nr = 3387

# Test for equal variance

var.test(left,right)

# They are not the same.  Thus we opt for Welch's two-sample t-test

t.test(left,right)

# The result is significant at the .05 level.  Right handers live longer.

# We visualize the data.

plot(1,-1,ylim=c(0,.04),xlim=c(0,110),main="Life Expectancy of Cricketers",
xlab="Life Expectancy",ylab="density")
lines(density(left),col="red",lwd=3)
lines(density(right),col="blue",lwd=3)
legend(5, 0.035, legend=c("Left-handed", "Right-handed"),
col=c("red", "blue"), text.font=4, bg='gray90',lty=c(1,1,1))

# It is obvious that there is a spike in mortality for younger left-handed
# cricket players.  

# An article using this data set is found at the following site.
# https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2542664/
