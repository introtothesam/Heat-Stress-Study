# -------------------------------------------------
# LOAD PACKAGES 
# -------------------------------------------------
library(tidyverse)
library(forcats) 
# -------------------------------------------------
# READ IN RAW DATASETS
# -------------------------------------------------
demographics_data <- read_csv("data/simulated/demographics.csv")
rc_rage_data <- read_csv("data/simulated/rc_rage_raw.csv")
novaco_data <- read_csv("data/simulated/novaco_raw.csv")
panas_data <- read_csv("data/simulated/panas_raw.csv")
bis_data <- read_csv("data/simulated/BIS_raw.csv")
bpaq_data <- read_csv("data/simulated/BPAQ_raw.csv")

# Main goals for data transformation:
# 1. Clean rc_rage_data: round kill_rate; drop unnecessary columns (clickCnt, killCnt) before merge
# 2. Reshape panas_data: PANASPA,PANASNA,Hostile_Affect,Irritable_Affect; convert from long to wide format
# 3. Rename and calculate bis_data subscale: BISTotal, BIS_Nonplanning, BIS_Motor, BIS_Attentional	
# 4. Rename and calculate bpaq_data subscale:  BPAQTotal, BPAQ_Physical, BPAQ_Verbal, BPAQ_Anger
# 5. Join dataset together by ID and session use `left_join()` from `dplyr`
# 6. String Manipulation
# 7. Factor Manipulation

# -------------------------------------------------
# 1. Clean `rc_rage_data`
# -------------------------------------------------
# Round kill rates and drop unnecessary columns
# Remove columns safely (only if they exist)
rc_rage_data <- rc_rage_data %>%
  dplyr::select(-clickCnt, -killCnt)

# Continue with rounding transformations
rc_rage_data <- rc_rage_data %>%
  mutate(across(starts_with("killRate"), ~ pmin(1, pmax(0, round(.x, 3)))))
# -------------------------------------------------
# 2. Reshape `panas_data`
# -------------------------------------------------
# PANAS subscales computation
panas_data <- panas_data %>%
  # Compute PANAS subscales for each timepoint separately
  group_by(ID, session, timepoint) %>%
  mutate(
    # Positive Affect (PANASPA) = Sum of positive affect items at the specific timepoin
    PANASPA = sum(Active, At_Ease, Happy, Calm, Motivated, Refreshed, na.rm = TRUE),
    
    # Negative Affect (PANASNA) = Sum of negative affect items at the specific timepoint
    PANASNA = sum(Anxious, Gloomy, Bored, Tired, Hostile, Annoyed, na.rm = TRUE),
    
    # Hostile Affect = Sum of "Hostile" item at the specific timepoint
    Hostile_Affect = sum(Hostile, na.rm = TRUE),
    
    # Irritable Affect = Sum of "Annoyed" item at the specific timepoint
    Irritable_Affect = sum(Annoyed, na.rm = TRUE)
  ) %>%
  ungroup() %>%  # Remove grouping after computation
  
  # Retain only relevant columns for analysis
  dplyr::select(ID, session, timepoint, PANASPA, PANASNA, Hostile_Affect, Irritable_Affect) %>%
  
  # Reshape data from long format (one row per timepoint) to wide format 
  pivot_wider(
    names_from = timepoint,  # Convert "timepoint" values into separate columns
    values_from = c(PANASPA, PANASNA, Hostile_Affect, Irritable_Affect),  # Expand these variables
    names_glue = "{.value}_{timepoint}"  # Append timepoint labels (e.g., PANASPA_T0, PANASPA_T1, ...)
  )

# -------------------------------------------------
# 3. Rename and Compute `bis_data` Subscales
# -------------------------------------------------
# Handling reverse coded questions in BIS (labeled with *)
# Attentional:	5, 6, 9*, 11, 20*, 24, 26, 28 
# Motor:	2, 3, 4, 16, 17, 19, 21, 22, 23, 25, 30* 
# Nonplanning:	1*, 7*, 8*, 10*, 12*, 13*, 14, 15*, 18, 27, 29* 
# Original scale: 1 (Rarely/Never) - 4 (Almost Always)
# Reverse coding function: reverse score(x) = max(x) + 1 - x

# Define reverse-coded BIS items
reverse_items <- c(1, 7, 8, 9, 10, 12, 13, 15, 20, 29, 30)

reverse_code <- function(x, max_val) max_val + 1 - x

# Reverse-code necessary items
bis_data <- bis_data %>%
  mutate(across(all_of(paste0("BIS_", reverse_items)), ~ reverse_code(.x, 4)))

# Compute BIS subscale scores
bis_data <- bis_data %>%
  rowwise() %>%  # Ensure sum is computed per participant
  mutate(
    # Attentional Subscale (8 items)
    BIS_Attentional = sum(c_across(all_of(paste0("BIS_", c(5, 6, 9, 11, 20, 24, 26, 28))))),
    
    # Motor Subscale (11 items)
    BIS_Motor = sum(c_across(all_of(paste0("BIS_", c(2, 3, 4, 16, 17, 19, 21, 22, 23, 25, 30))))),
    
    # Nonplanning Subscale (11 items)
    BIS_Nonplanning = sum(c_across(all_of(paste0("BIS_", c(1, 7, 8, 10, 12, 13, 14, 15, 18, 27, 29))))),
    
    # Compute Total BIS Score (Sum of all 30 items)
    BISTotal = sum(c_across(starts_with("BIS_")))  # Ensures all BIS items are included
  ) %>%
  ungroup()  # Remove rowwise grouping

# Retain only relevant columns
bis_data <- bis_data %>%
  dplyr::select(ID, BIS_Attentional, BIS_Motor, BIS_Nonplanning, BISTotal)
# -------------------------------------------------
# 4. Rename and Compute `bpaq_data` Subscales
# -------------------------------------------------
# Physical Aggression: (items 1-9)
# Verbal Aggression: (items 10-14)
# Anger: (items 15-21)
# Hostility: (items 22-29)
# Reverse coded: 7, 18
# Original scale: 1-5

# Define reverse-coded BPAQ items
reverse_items <- c(7, 18)

# Reverse-code necessary BPAQ items
bpaq_data <- bpaq_data %>%
  mutate(across(all_of(paste0("BPAQ_", reverse_items)), ~ reverse_code(.x, 5)))

# Compute BPAQ subscale scores
bpaq_data <- bpaq_data %>%
  rowwise() %>%  # Ensure sum is computed per participant
  mutate(
    # Physical Aggression Subscale (9 items)
    BPAQ_Physical = sum(c_across(all_of(paste0("BPAQ_", 1:9)))),
    
    # Verbal Aggression Subscale (5 items)
    BPAQ_Verbal = sum(c_across(all_of(paste0("BPAQ_", 10:14)))),
    
    # Anger Subscale (7 items)
    BPAQ_Anger = sum(c_across(all_of(paste0("BPAQ_", 15:21)))),
    
    # Hostility Subscale (8 items)
    BPAQ_Hostility = sum(c_across(all_of(paste0("BPAQ_", 22:29)))),
    
    # Compute Total BPAQ Score (Sum of all 29 items)
    BPAQTotal = sum(c_across(starts_with("BPAQ_")))  # Ensures all BPAQ items are included
  ) %>%
  ungroup()  # Remove rowwise grouping

# Retain only the final BPAQ subscale scores and participant ID
bpaq_data <- bpaq_data %>%
  dplyr::select(ID, BPAQ_Physical, BPAQ_Verbal, BPAQ_Anger, BPAQ_Hostility, BPAQTotal)

# -------------------------------------------------
# 5. Join Dataset Together
# -------------------------------------------------
# Merge datasets
merged_data <- demographics %>%
  left_join(rc_rage_data, by = c("ID", "session", "date")) %>%
  left_join(novaco_data, by = c("ID", "session", "date")) %>%
  left_join(panas_data, by = c("ID", "session")) %>%
  left_join(bis_data, by = "ID") %>%
  left_join(bpaq_data, by = "ID")

# -------------------------------------------------
# 6. String Manipulation (`stringr`)
# -------------------------------------------------
# Rename kill rates for clarity
merged_data <- merged_data %>%
  rename(Advantages = killRate_1or2, ModestlyCostly = killRate_3or4, StronglyCostly = killRate_6or7)

# -------------------------------------------------
# 7. Factor Manipulation (`forcats`)
# -------------------------------------------------
merged_data <- merged_data %>%
  mutate(
    gender = factor(gender, levels = c("Female", "Male", "Other", "Prefer not to answer")),
    session = factor(session, levels = c(1, 2, 3), ordered = TRUE),
    temperature_condition = fct_rev(fct_relevel(temperature_condition, "CTRL", "MID", "HOT"))  
  )

# -------------------------------------------------
# 8. Save Final Transformed Dataset
# -------------------------------------------------
write_csv(merged_data, "data/heat_stress_data.csv")

# -------------------------------------------------
# 9. Split Data into Three Subsets Based on Conditions
# -------------------------------------------------
ctrl_data <- merged_data %>% filter(str_detect(temperature_condition, "CTRL"))
mid_data <- merged_data %>% filter(str_detect(temperature_condition, "MID"))
hot_data <- merged_data %>% filter(str_detect(temperature_condition, "HOT"))

# Save the subsets
write_csv(ctrl_data, "data/heat_stress_ctrl.csv")
write_csv(mid_data, "data/heat_stress_mid.csv")
write_csv(hot_data, "data/heat_stress_hot.csv")


