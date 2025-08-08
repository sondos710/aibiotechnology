dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")
getwd()


patient_info <- read.csv(choose.files())


str(patient_info)

patient_info$gender_fac <- as.factor(patient_info$gender)
str(patient_info)


patient_info$diagnosis_fac <- as.factor(patient_info$diagnosis)
patient_info$smoker_fac <- as.factor(patient_info$smoker)
str(patient_info)

raw_data = patient_info[,1:6]

patient_info$smoker_num <- ifelse(patient_info$smoker_fac == "Yes" , 1 ,0)
write.csv(clean_data , file = "clean_data/patient_info.csv")
