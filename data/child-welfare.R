rm(list=ls(all=TRUE))  #Clear the variables from previous runs.

# ---- load-packages ------------------------------------------------------
requireNamespace("readr")
requireNamespace("dplyr")

# ---- declare-globals ------------------------------------------------------
pathInput <- "./unshared-material/data/ChildWelfareSubjectLevel.csv"
pathOutput <- "./data/ChildWelfare.csv"

# ---- load-data ------------------------------------------------------
dsSubject <- readr::read_csv(file=pathInput)

# ---- tweak-data ------------------------------------------------------
#Rename some variables to meet the same convention
dsSubject <- dsSubject %>% 
  dplyr::rename_(
    "County"      = "CountyID"         ,
    "EDUC"        = "EducationLevel"   , 
    "EMPL"        = "Employed"         , 
    "age"         = "Age"              , 
    "priors_all"  = "PriorOffenseCount", 
    "frs"         = "Frs"              , 
    "bdi"         = "Bdi"              
  )

#Remove unnecessary variable
dsSubject$id <- NULL

#Convert to a boolean variable
dsSubject$Employed <- as.logical(dsSubject$Employed)

#Covnert to a valid date
dsSubject$Date <- as.Date(dsSubject$Date,format="%m/%d/%Y")

#Convert missing values
# If I were doing this again, I'd probably use `dplyr::mutate_at()` and `dplyr::na_if`
columnsWith9999s <- c("EducationLevel", "Frs", "Bdi")
for( column in columnsWith9999s ) {
  dsSubject[, column] <- ifelse(dsSubject[, column]=="-9999", NA, dsSubject[, column])
}

#Strip off letters from CountyID
gsub(pattern="[A-Z]", replacement="pp2", x=dsSubject$CountyID, perl=F)

# grepl(pattern="[A-Z]", x=dsSubject$CountyID, perl=T)
# grepl(pattern="[A-Z]{1,}", x=dsSubject$CountyID, perl=T)
dsSubject$CountyID <- as.integer(gsub(pattern="[A-Za-z]{1,}", replacement="", x=dsSubject$CountyID, perl=T))
# table(dsSubject$CountyID)
# cat(dsSubject$CountyID)


# ---- write-to-disk -----------------------------------------------------------
write.csv(ds, file=pathOutput, row.names=F)
