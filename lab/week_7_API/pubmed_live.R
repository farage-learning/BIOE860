# BIOE 860 | Week 7 | Live PubMed REST API (NCBI E-utilities)
# Install once: install.packages("httr2")
# Workflow: ESearch returns PMIDs; ESummary returns article metadata.
# Use a small number of requests and follow NCBI usage guidance.

library(httr2)

# Set a timeout and retry policy for the request.
search_resp <- request("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi") |>
  req_url_query(db = "pubmed", term = "exercise AND diabetes",
                retmax = 5, retmode = "json") |>
  req_timeout(30) |>
  req_retry(max_tries = 3) |>
  req_perform()

# Print the HTTP status and parse the JSON response to extract PMIDs.
cat("Search HTTP status:", resp_status(search_resp), "\n")

# Parse the JSON response to extract PMIDs.
search <- resp_body_json(search_resp, simplifyVector = FALSE)
ids <- unlist(search$esearchresult$idlist, use.names = FALSE)
# Print the returned PMIDs and stop if no records were found.
cat("Returned PMIDs:", paste(ids, collapse = ", "), "\n")
if (length(ids) == 0) stop("No matching PubMed records; try a broader term.")

# Get article metadata for the returned PMIDs using ESummary.
summary_resp <- request("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi") |>
  req_url_query(db = "pubmed", id = paste(ids, collapse = ","),
                retmode = "json") |>
  req_timeout(30) |>
  req_retry(max_tries = 3) |>
  req_perform()

# Print the HTTP status and parse the JSON response to extract article metadata.
cat("Summary HTTP status:", resp_status(summary_resp), "\n")
summary <- resp_body_json(summary_resp, simplifyVector = FALSE)
get_value <- function(record, field) {
  value <- record[[field]]
  if (is.null(value) || length(value) == 0) return(NA_character_)
  as.character(value[[1]])
}

# Convert the list of article metadata to a data frame with selected fields.
articles <- do.call(rbind, lapply(ids, function(id) {
  rec <- summary$result[[id]]
  data.frame(pmid = id,
             title = get_value(rec, "title"),
             publication_date = get_value(rec, "pubdate"),
             journal = get_value(rec, "fulljournalname"),
             stringsAsFactors = FALSE)
}))

# Print the resulting data frame and save it to a CSV file.
print(articles[, c("pmid", "publication_date", "journal")], row.names = FALSE)
write.csv(articles, "pubmed_week7_live.csv", row.names = FALSE)
cat("Saved", nrow(articles), "publication records (not patient records).\n")
