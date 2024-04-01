######################################################################################
# Example to produce plot of:
# Relative distance in Feature Space (x) versus Relative Distance in Response space (y)
#######################################################################################
#
# Assume we are given a table with a single response variable
# Want to make a table with the (x) and (y) values as 2 columns
# 
# IN: d - the dataframe or matrix 
#     response.var - the number of the column used as the response variable. 
#     Defaults to last column of the dataframe 
# OP: Calculates the normalised distance between each pair of data items in 
#     explanatory space and the distance between their response variables. 
# OUT: Data frame with 2 columns, the distance in feature space (x), and 
#      distance in response space (y)
########################################################################################
dist.table <- function(d, response.var = ncol(d))  
{
  d <- scale(d) # scale data
	d.dist <- dist(d[,-response.var])  # distance all X values	
	d.resp <- dist(d[,response.var])
	
	d.dist <- (d.dist-min(d.dist))/(max(d.dist)-min(d.dist))
	d.resp <- (d.resp-min(d.resp))/(max(d.resp)-min(d.resp))
	
	data.frame(cbind(d.dist,d.resp))
}
###################################################################
# plot.dist.table
# IN: d -- the distance table created from function dist.table(...)
# OP: Plot points in d with quadrants
####################################################################
plot.dist.table <- function(d)
{
  plot(x=d$d.dist, y = d$d.resp,xlab="Normalised Distance in Feature Space",
       ylab="Normalised Distance in Response Space",cex=0.5)
  abline(h=0.5,lty=2,lwd=2,col=2)
  abline(v=0.5,lty=2,lwd=2,col=2)
  text(x=0.2,y=0.8,"A",cex=2,col=2)
  text(x=0.85,y=0.4,"D",cex=2,col=2)
  text(x=0.2,y=0.4,"C",cex=2,col=2)
  text(x=0.85,y=0.8,"B",cex=2,col=2)  
}
#
# Example with simple linear response, random X1 and X2 but no noise for response
##################################
# Start by making some data
X1 <- runif(100)
X2 <- runif(100)
Y <- (X1 + X2)
#
ex1 <- data.frame(cbind(X1,X2,Y))  # Make a table with 3 columns.  The response
                                   # (dependent) variable is column 3. 
##################################
#
# Now construct the distance table
d <- dist.table(ex1, response.var = 3)

# and plot it!
plot.dist.table(d)