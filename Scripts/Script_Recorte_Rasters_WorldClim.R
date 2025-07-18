#loading packages -------------------------------------
library(dplyr)
library(readr)
library(raster)
library(dismo)
library(sp)

#loading data ----------------------------------------
#environment layers
bio1 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_1.tif")
bio2 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_2.tif")
bio3 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_3.tif")
bio4 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_4.tif")
bio5 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_5.tif")
bio6 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_6.tif")
bio7 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_7.tif")
bio8 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_8.tif")
bio9 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_9.tif")
bio10 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_10.tif")
bio11 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_11.tif")
bio12 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_12.tif")
bio13 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_13.tif")
bio14 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_14.tif")
bio15 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_15.tif")
bio16 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_16.tif")
bio17 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_17.tif")
bio18 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_18.tif")
bio19 <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_bio_19.tif")
elev  <- raster("C:/Users/Museu Nacional/Desktop/rasters/wc2.1_10m_elev.tif")

#tamanho do Brasil ----------------------------------------------
america_extent <- extent(-82, -30, -56, 13)

#unindo todos os rasters em um unico pacote ------------------------------
variables <- stack(bio1, bio2, bio3, bio4, bio5, bio6, bio7, bio8, bio9, bio10,
                   bio11, bio12, bio13, bio14, bio15, bio16, bio17, bio18, bio19,
                   elev)

#cortando as variáveis --------------------------------------------------
variables <- crop(variables, brasil_extent) %>%
  stack()

plot(variables$wc2.1_10m_bio_1)

# salvando os elementos individualmente -----------------------------------
# definir diretório de saída (pode ser o mesmo dos rasters originais)
output_dir <- "C:/Users/Museu Nacional/Desktop/rasters2/"

# salvar cada camada recortada com sufixo "_america_extent"
for (i in 1:nlayers(variables)) {
  layer <- variables[[i]]
  original_name <- names(layer)
  output_name <- paste0(original_name, "_america_extent.tif")
  output_path <- file.path(output_dir, output_name)
  
  writeRaster(layer,
              filename = output_path,
              format = "GTiff",
              overwrite = TRUE)
}