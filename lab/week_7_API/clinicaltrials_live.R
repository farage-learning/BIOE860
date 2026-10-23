# BIOE 860 | Week 7 | Live ClinicalTrials.gov REST API
# Install once: install.packages("httr2")
# Data are public study registry records, not participant-level observations.

library(httr2)

base_url <- "https://clinicaltrials.gov/api/v2/studies"

# Get a page of study records from the ClinicalTrials.gov API.
get_page <- function(endpoint = NULL, token = NULL, n = 10,
                     condition = "type 2 diabetes", status = "RECRUITING") {
  req <- request(endpoint) |>
    # Add query parameters for the search condition, status filter, page size, and response format.
    req_url_query(
      `query.cond` = condition,
      `filter.overallStatus` = status,
      pageSize = n,
      format = "json"
    ) |>
    # Set a timeout and retry policy for the request.
    req_timeout(30) |>
    req_retry(max_tries = 3)

  # If a page token is provided, add it to the request.
  if (!is.null(token)) req <- req |> req_url_query(pageToken = token)
  resp <- req |> req_perform()
  cat("HTTP status:", resp_status(resp), "\n")
  resp_body_json(resp, simplifyVector = FALSE)
}


# Extract a single field from a study record, returning NA if missing.
field <- function(s, module, name) {
  m <- s$protocolSection[[module]]
  if (is.null(m)) return(NA_character_)
  v <- m[[name]]
  if (is.null(v) || length(v) == 0) return(NA_character_)
  as.character(v[[1]])
}

# Convert a list of study records to a data frame with selected fields.
to_table <- function(studies) {
  if (length(studies) == 0) return(data.frame(
    nct_id = character(), title = character(), status = character()))
  do.call(rbind, lapply(studies, function(s) data.frame(
    nct_id = field(s, "identificationModule", "nctId"),
    title = field(s, "identificationModule", "briefTitle"),
    status = field(s, "statusModule", "overallStatus"),
    stringsAsFactors = FALSE
  )))
}

# Get the first page of study records and print a summary.
first <- get_page(base_url, n = 10)
cat("Studies on first page:", length(first$studies), "\n")
print(utils::head(to_table(first$studies), 3))

# Get a second page of study records if available, and combine with the first page.
all_studies <- first$studies
# Only request a second page for teaching; do not bulk download.
if (!is.null(first$nextPageToken)) {
  second <- get_page(base_url, token = first$nextPageToken, n = 10)
  all_studies <- c(all_studies, second$studies)
}

# Convert the combined study records to a data frame, check for duplicates, and save to CSV.
trials <- to_table(all_studies)
stopifnot(!anyDuplicated(trials$nct_id))
print(table(trials$status, useNA = "ifany"))
write.csv(trials, "clinicaltrials_week7_live.csv", row.names = FALSE)
cat("Saved", nrow(trials), "study records. Results change over time.\n")
