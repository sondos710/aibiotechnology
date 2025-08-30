gene <- "TP53"
gene




expression_levels <- c(1.5,2.6,4.6,2.8)



raw_data <- read.csv(choose.files())
data <- raw_data
raw_data$patient_id <- NULL
clean_data <- data[,-1]



sorted_age <- sort(raw_data$age , decreasing = TRUE)
sorted_age
sortedaage2 <- sort(raw_data$age , decreasing = FALSE)
sortedaage2

gene_expression <- 30


if(gene_expression > 50) {print("gene is highly expressed")}else {print("gene expression is low")}


raw_data <- read.csv(choose.files())

raw_data
str(raw_data)
#gender from chr to factor 
#diagnosis from chr to factor 
#bmi from chr to factor


#loop function


for ( i in 1:ncol(clean_data)) {
  if (is.character(clean_data[[i]])) {clean_data[[i]] <- as.factor(clean_data[[i]])}
  
}  
str(clean_data) 

####heading####


write.csv(clean_data , file= "clean_data.csv")

ll




