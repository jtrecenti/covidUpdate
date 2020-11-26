#' Baixa o CSV da base da covid em uma pasta
#'
#' @param pasta pasta onde salvarei o arquivo
#'
#' @export
baixar_dados_covid <- function(pasta) {

  dir.create(pasta, showWarnings = FALSE, recursive = TRUE)
  u_portal_geral <- "https://xx9p7hp1p7.execute-api.us-east-1.amazonaws.com/prod/PortalGeral"

  r <- httr::GET(
    u_portal_geral,
    httr::add_headers(
      "x-parse-application-id" = "unAFkcaNDeXajurGB7LChj8SgQYS2ptm"
    )
  )

  link_csv <- httr::content(r)$results[[1]]$arquivo$url

  f <- paste0(pasta, "/dados_covid.csv")
  httr::GET(
    link_csv,
    httr::write_disk(f),
    httr::progress()
  )

  f
}
