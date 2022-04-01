#' a uniform two dimensional grid of lattice points
#' @param lat numeric vector
#' @param long numeric vector
#' @return returns a dataframe of lattice points
#' @examples spatial_grid(c(1:10),c(1:10))
#' @export
spatial_grid<-function(lat,long){
  sp_grid <- base::expand.grid(lat, long)
  return(sp_grid)
}

