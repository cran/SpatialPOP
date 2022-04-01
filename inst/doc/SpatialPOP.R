## -----------------------------------------------------------------------------
# Examples: generate an uniform two dimensional grid of lattice points 

library(SpatialPOP)
coord_grid=spatial_grid(c(1:5),c(1:5))
coord_grid=as.data.frame(coord_grid)
names(coord_grid)=cbind("x","y")
coord_grid
plot(coord_grid)

# Examples: simulated data along with spatial coordinates and spatially varying model parameters

library(SpatialPOP)

coord_grid=spatial_grid(c(1:5),c(1:5))
coord_grid=as.data.frame(coord_grid)
names(coord_grid)=cbind("x","y")
coord_grid
N<-nrow(coord_grid)
N
m<-sqrt(nrow(coord_grid))
m


spatial_data<-spatialPOP(25,5,c(1:5),c(1:5))
spatial_data

