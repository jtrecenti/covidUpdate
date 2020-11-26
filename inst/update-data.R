covidUpdate::baixar_dados_covid("inst/")
da_covid <- read.csv2("inst/dados_covid.csv", nrows = 1000)
da_covid$data_atualizacao <- Sys.time()
usethis::use_data(da_covid, overwrite = TRUE, compress = "xz")

