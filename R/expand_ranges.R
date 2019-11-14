
#' Expand Ranges
#'
#' Expand TSS GRanges for downstream analysis
#'
#' @importFrom GenomicRanges GRanges strand
#' @importFrom purrr map
#'
#' @param experiment deep_tss object
#' @param sequence_expansion Number of bases to expand on each side for surrounding sequence analysis
#' @param signal_expansion Number of bases to expand on each side for surrounding signal analysis
#'
#' @return Expanded GRanges objects
#'
#' @export

expand_ranges <- function(
	experiment,
	sequence_expansion = 10,
	signal_expansion = 15
) {
	sequence_expanded <- map(experiment$experiment, ~ expand_range(.x, sequence_expansion))
	signal_expanded <- map(experiment$experiment, ~ expand_range(.x, signal_expansion))

	experiment@ranges <- list(
		"sequence" = sequence_expanded,
		"signal" = signal_expanded
	)

	return(experiment)
}

#' Expand Ranges Function
#'
#' Backend function to expand granges
#'
#' @importFrom GenomicRanges GRanges strand resize sort
#'
#' @param grange GRange object to expand
#' @param expand_size Size to expand ranges on each side of TSS
#'
#' @return Expanded GRanges object

expand_range <- function(grange, expand_size) {
	tss_pos <- tss_granges[strand(tss_granges) == "+"] %>%
                resize(width = expand_size, fix = "start") %>%
                resize(width = width(.) + expand_size, fix = "end")

        tss_neg <- tss_granges[strand(tss_granges) == "-"] %>%
                resize(width = expand_size, fix = "end") %>%
                resize(width = width(.) + expand_size, fix = "start")

        tss_ranges <- c(tss_pos, tss_neg) %>% sort

        tss_status <- tss_ranges %>%
                score %>%
                {ifelse(. <= 3, 1, 0)}

        return(tss_ranges)
}