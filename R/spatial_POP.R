#'Generation of Spatial Data  with Spatial Coordinates and Spatially Varying Model Parameters
#' @param xlat numeric vector
#' @param ylong numeric vector
#' @param m   integer
#' @param N   integer; population size i.e. N= (m * m)
#' @return returns a dataframe of spatially generated population consist of simulated response variable (i.e. Y) along with their spatial coordinates, spatially varying model parameters and one explanatory variable (i.e. X)
#' @examples
#' lattice_points<-spatial_grid(c(1:10),c(1:10))
#' spatial_data<-spatialPOP(100,10,c(1:10),c(1:10))
#' @references
#'
#'  1. Leung, Y., Mei, C. L. and Zhang, W. X. (2000). Statistical tests for spatial non-stationarity based on the geographically
#'                weighted regression model. Environment and Planning A, 32(1), 9-32.
#'
#'
#'  2. Chao, Liu., Chuanhua, Wei. and Yunan, Su. (2018). Geographically weighted regression model-assisted estimation in survey sampling. Journal of Nonparametric Statistics. <DOI:10.1080/10485252.2018.1499907>.
#'
#' @export
#' @import qpdf
#' @import numbers
#' @importFrom stats rnorm runif
spatialPOP<-function(N,m,xlat,ylong) {

xy_grid <- spatial_grid(xlat,ylong)
xy_grid
names(xy_grid) <- c("x","y")

N<-nrow(xy_grid)
m<-sqrt(nrow(xy_grid))
id<-seq(1:N)

# generation of auxiliary variable from uniform distribution
X<-runif(N,0,1)
X

# error term drawn independently from normal distribution N(0,1)

e<- rnorm(N, mean=0, sd=1)
e

# generation of spatial coordinates of locations

Latitude<-(mod((id-1),m))
Latitude

Longitude<-(as.integer((id-1)/m))
Longitude

spa_location<-as.data.frame(cbind(Latitude,Longitude))
names(spa_location)<-cbind("Latitude","Longitude")
spa_location

# generation of regression coefficients

B0<-(Latitude+Longitude)/6
B1<-(Latitude/3)

# spatially varying model for generating the dataset
Y_sim<-B0+(B1*X)+ e
Y_sim<-as.data.frame(Y_sim)

# simulated data along with spatial coordinates and model parameters
spa_pop<-cbind(Y_sim,X,Latitude,Longitude,B0,B1)
spa_pop<-as.data.frame(spa_pop)
names(spa_pop)=cbind("Y","X","latitude","longitude","B0","B1")
return(spa_pop)

}


