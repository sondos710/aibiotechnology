


classify_gene <- function(logFC, padj) {
  if (is.na(padj)) {
    padj <- 1   
  }
  
  if (logFC > 1 && padj < 0.05) {
    return("Upregulated")
  } else if (logFC < -1 && padj < 0.05) {
    return("Downregulated")
  } else {
    return("Not_Significant")
  }
}

classify_gene(2,0.01)
classify_gene(2,NA)

getwd()
outdir <- "Results"
if (!dir.exists(outdir)) dir.create(outdir)


files <-c("DEGs_Data_1.csv" , "DEGs_Data_2.csv")



for (file in files) {
  
  data <- read.csv(file, stringsAsFactors = FALSE)
  
  
  data[["padj"]][is.na(data[["padj"]])] <- 1
  
  
  data[["status"]] <- mapply(classify_gene, data[["logFC"]], data[["padj"]])
  
  
  outfile <- file.path(outdir, paste0("processed_", file))
  write.csv(data, outfile, row.names = FALSE)
  
  
  cat("\nSummary for", file, ":\n")
  print(table(data[["status"]]))
}
 


