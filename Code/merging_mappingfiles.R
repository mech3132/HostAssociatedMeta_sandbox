#!bin/bash
library(tidyverse)


############# Merging Mapping Files #################
ID550 <- read.delim("Raw_data/metadata/550_20200106-124938.txt", as.is = TRUE)
ID933 <- read.delim("Raw_data/metadata/933_20180418-110642.txt", as.is = TRUE)
ID2182 <- read.delim("Raw_data/metadata/2182_20180418-110523.txt", as.is = TRUE)
ID2382 <- read.delim("Raw_data/metadata/2382_20180418-110542.txt", as.is = TRUE)

removecol <- c("emp_release1","dna_extracted","physical_specimen_remaining", "public","extracted_dna_avail_now", "depth","depth_m")
ID550 <- ID550 %>% select(-one_of(removecol))
ID933 <- ID933 %>% select(-one_of(removecol))
ID2182 <- ID2182 %>% select(-one_of(removecol))
ID2382 <- ID2382 %>% select(-one_of(removecol))

merged <- ID550 %>% full_join(ID933) %>% full_join(ID2182) %>% full_join(ID2382)
colnames(merged)

# meta_of_interest <- c("sample_name","collection_timestamp","host_scientific_name", "sample_type"
#                       ,"host_age","host_body_site","host_common_name","host_age_units"
#                       ,"anonymized_name","smoker","diet","abx_past_6_mos","atherosclerosis","chronic_condition","days_since_epoch","sun_shade","age","body_habitat","hiv_stat","temp","age_unit","myocardinfarct","sex","temperature_deg_c"
#                       ,"vineyard","clone")
# 
# toKeep <- c(colnames(merged)[grep("^empo|env_",colnames(merged))],meta_of_interest)

# merged_filt <- merged %>% select(one_of(toKeep))


table(merged$empo_3)
table(merged$host_scientific_name)
any(is.na(merged$collection_timestamp))
table(merged$anonymized_name)
