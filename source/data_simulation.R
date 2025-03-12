# Simulate Data Using `simstudy`
# Package required: 
# install.packages("simstudy")
# install.packages("data.table")

# RC-RAGE behavioral dataset are simulated based on previous RC-RAGE study
# The current simulated dataset matching observed distributions from the reference dataset

# -------------------------------------------------
# PACKAGES & INITIAL SETUP
# -------------------------------------------------

library(simstudy)   # For simulating data
library(data.table) # Efficient data handling
library(tidyverse)  # For saving and manipulating data

# Set seed for reproducibility
set.seed(1234) # Ensures consistent random number generation

# Number of participants and sessions
n_participants <- 50 # Simulate 50 participants
n_sessions <- 3  # Each participant attends 3 sessions

# Generate participant IDs
participant_ids <- 1:n_participants 

# Define temperature conditions
temp_conditions <- c("CTRL", "MID", "HOT")  # Control, 97°F, 113°F

# -------------------------------------------------
# 1. Simulate Demographics & Experimental Conditions (demographics.csv)
# -------------------------------------------------

# Create an empty dataframe to store session data
demographics <- data.table()

# Define the start date range for the first session
start_date_min <- as.Date("2025-02-20")  # Earliest start date
start_date_max <- as.Date("2025-08-31")  # Latest start date

# Define gender categories and probabilities
gender_options <- c("Female", "Male", "Other", "Prefer not to answer")  
gender_probs <- c(0.60, 0.39, 0.005, 0.005)  # Female 60%, Male 39%, Other 0.5%, Prefer not to answer 0.5%

# Assign each participant to all three temperature conditions in a random order
for (id in participant_ids) {
  
  # Randomize session order for each participant
  session_order <- sample(temp_conditions, size = n_sessions, replace = FALSE)
  
  # Generate random start date for the first session within the allowed range
  start_date <- sample(seq(start_date_min, start_date_max, by = "1 day"), 1)
  
  # Generate session dates (each session is exactly 7 days apart)
  session_dates <- seq(start_date, by = "7 days", length.out = n_sessions)  # One week apart
  
  # Generate random age (between 18-35) for each participant
  age <- sample(18:35, 1)
  
  # Assign gender based on weighted probabilities
  gender <- sample(gender_options, 1, prob = gender_probs)
  
  # Create session data for this participant
  participant_data <- data.table(
    ID = rep(id, n_sessions),  # Same id across all sessions
    age = rep(age, n_sessions),  # Same age across all sessions
    gender = rep(gender, n_sessions),  # Same gender across all sessions
    session = 1:n_sessions,  # Session number (1, 2, 3)
    date = session_dates,
    temperature_condition = session_order
  )

  # Append to main demographics table
  demographics <- rbind(demographics, participant_data)
}

# Save demographics dataset
write_csv(demographics, "data/simulated/demographics.csv")

# -------------------------------------------------
# 2. Simulate Behavioral RC-RAGE Task Data (rc_rage_raw.csv)
# -------------------------------------------------
# Previous RC-RAGE study dataset distribution:
# Variable    	Distribution	Mean (Reference)   Notes
# clickCnt	     Normal	      431.38	           Min: 194, Max: 579, Slightly Right-Skewed
# killCnt	       Poisson    	5.927	             Count data, Min: 0, Max: 16
# killRate_1or2	 Beta	        0.862	             Highly skewed (Most values near 1)
# killRate_3or4	 Beta	        0.3577            	Moderately skewed (More zeros)
# killRate_6or7	 Beta.      	0.1861	           Very skewed (Most values near 0)

# Under Heat Stress, based on hypothesis:
# Higher costly retaliation rates 
# killRate_3or4 (+5% in logit space) and killRate_6or7 (+2% in logit space) increase slightly.
# More overall aggression
# killCnt increases slightly (+1 or +2)

# Define data structure
rc_rage_def <- defData(varname = "clickCnt", dist = "normal", 
                       formula = 431.38, variance = 50^2)
rc_rage_def <- defData(rc_rage_def, varname = "killCnt", dist = "poisson", 
                       formula = 5.927) # Poisson distribution

# Define retaliation rates (Beta distributed)
# Convert Beta(6,1) to mean and variance 
# Skewed near 1
rc_rage_def <- defData(rc_rage_def, varname = "killRate_1or2", dist = "beta",
                       formula = 6 / (6 + 1), 
                       variance = (6 * 1) / ((6 + 1)^2 * (6 + 1 + 1)))

# Convert Beta(4,2) to mean and variance
# Moderate skew
rc_rage_def <- defData(rc_rage_def, varname = "killRate_3or4", dist = "beta",
                       formula  = 6 / (6 + 4),  
                       variance = (6 * 4) / ((6 + 4)^2 * (6 + 4 + 1)))

# Convert Beta(3,4) to mean and variance
# More zeros
rc_rage_def <- defData(rc_rage_def, varname = "killRate_6or7", dist = "beta",
                       formula = 3 / (3 + 4), 
                       variance = (3 * 4) / ((3 + 4)^2 * (3 + 4 + 1)))

# Generate initial dataset (150 total rows: 50 ID × 3 sessions)
rc_rage_data <- genData(n_participants * n_sessions, rc_rage_def)
setDT(rc_rage_data) # Ensure it's a data.table

# remove the simstudy "id" column:
rc_rage_data[, id := NULL]

# Enforce Click Count Range
rc_rage_data[, clickCnt := pmax(194, pmin(clickCnt, 579))] 
rc_rage_data[, clickCnt := as.integer(round(clickCnt))]  # integer

# Ensure Kill Count is Whole Number (Poisson Output is Non-Negative)
rc_rage_data[, killCnt := pmax(0, floor(killCnt))] 

# Add participant IDs & session dates in a consistent, matching order
rc_rage_data[, ID := rep(1:n_participants, each = n_sessions)]
rc_rage_data[, session := rep(1:n_sessions, times = n_participants)]

# Merge temperature condition & date from demographics by ID & session
rc_rage_data <- merge(
  rc_rage_data,
  demographics[, .(ID, session, temperature_condition, date)], 
  by = c("ID", "session")
)

# Adjust for Heat Stress Effects (Only for HOT condition)
# killRate_3or4 increased by 2% for HOT conditions
# killRate_6or7 increased by 1% for HOT conditions
# To ensure values remain in valid beta-distributed range (0,1), use logit Transformation 
# This preserves the original distribution while ensuring HOT leads to slightly more aggressive choices in a non-artificial way

# Define Logit Transform Function (to Ensure Values Stay Within [0,1])
logit_transform <- function(x, shift) {
  # shift in logit space; clamp final [0,1]
  pmax(0, pmin(1, plogis(qlogis(x) + shift)))
}

# Adjust Behavior for HOT Condition (Increased Aggression)
rc_rage_data[, killRate_3or4 := ifelse(
  temperature_condition == "HOT", 
  logit_transform(killRate_3or4, 0.03), killRate_3or4
)]

rc_rage_data[, killRate_6or7 := ifelse(
  temperature_condition == "HOT", 
  logit_transform(killRate_6or7, 0.08), 
  killRate_6or7
)]

# Increase Kill Count Slightly for HOT Condition
rc_rage_data[, killCnt := ifelse(
  temperature_condition == "HOT", 
  pmin(16, killCnt + sample(1:2, .N, replace = TRUE)), 
  killCnt
)]  

# Drop temperature condition before saving (mimic ongoing real data collection situation)
rc_rage_data[, temperature_condition := NULL]

# Save the rc_rage dataset
write_csv(rc_rage_data, "data/simulated/rc_rage_raw.csv")

# -------------------------------------------------
# 3. Simulate NOVACO Anger Data (novaco_raw.csv)
# -------------------------------------------------
# Previous studies that the observed mean NOVACO anger score was ~50 for one session (likely based on a larger set of questions)
# We are working with 6 questions per session, where each item is rated from: 1(Little or no annoyance) ~ 5(Very angry)
# In this case, the simulated NOVACO dataset keeping the 6-question total in the range [6, 30]

novaco_data <- demographics[, .(ID, session, date)]  # 150 rows

# Generate 6-item NOVACO anger responses (1-5 scale)
generate_novaco_score <- function() {
  # Generate 6 responses per session
  item_scores <- sample(1:5, 6, replace = TRUE)
  # Compute total score (natural range: 6 to 30)
  total_score <- sum(item_scores)
  return(total_score)
}

# Create NOVACO anger dataset
novaco_data[, NovacoAnger := sapply(1:.N, function(i) generate_novaco_score())]

# Save NOVACO dataset
write_csv(novaco_data, "data/simulated/novaco_raw.csv")

# -------------------------------------------------
# 4. Simulate PANAS (panas_raw.csv) 
# -------------------------------------------------
# We will collect PANAS questionnaire at four time points per session:
# Time Point	When Collected?
# T0	        Before entering the sauna
# T1	        After Backward Digit Span Task (in sauna)
# T2	        After Stop Signal Task (in sauna)
# T3        	After RC-RAGE Task (in sauna)
# => 50 participants × 3 sessions × 4 timepoints = 600 rows
# 12 items for each row, each rated 1..6
# Asking: how you feel right now?
# Range: 1 (Not at all) - 6 (Very much)

# Define PANAS items
panas_items <- c("Active", "At_Ease", "Happy", "Calm", "Motivated", "Refreshed",
                 "Anxious", "Gloomy", "Bored", "Tired", "Hostile", "Annoyed")

# Create the base structure: 600 rows
panas_data <- expand.grid(
  ID = 1:n_participants,
  session = 1:n_sessions,
  timepoint = c("T0", "T1", "T2", "T3")
) %>%
  as.data.table()  # easier for merges

# Merge in date from demographics to match each ID-session
panas_data <- merge(
  panas_data, 
  demographics[, .(ID, session, date)], 
  by = c("ID", "session")
)

# Generate random PANAS scores for each of the 12 items
set_panas_scores <- function(n_rows) {
  # Return a data.table with one column per PANAS item
  out <- replicate(
    length(panas_items),
    sample(1:6, n_rows, replace = TRUE)  # random 1–6
  )
  colnames(out) <- panas_items
  as.data.table(out)
}

# Bind the item scores
scores_dt <- set_panas_scores(nrow(panas_data))
panas_data <- cbind(panas_data, scores_dt)

# Save dataset
write_csv(panas_data, "data/simulated/panas_raw.csv")

# -------------------------------------------------
# 5. Simulate BIS Impulsivity Personality Trait Data (BIS_raw.csv)
# -------------------------------------------------
# BIS-11 is administered once during the pre-screening phase to establish a baseline measure of impulsivity
# Response Options (Likert scale, 1-4): (1) Rarely/Never, (2) Occasionally, (3) Often, (4) Almost Always/Always
# Total Number of Items: 30

# Define BIS item names
bis_items <- paste0("BIS_", 1:30)

# Generate a 50×30 matrix (one row per participant)
bis_responses <- matrix(
  sample(1:4, n_participants * 30, replace = TRUE),
  nrow = n_participants, ncol = 30
)

# Convert to data.table
bis_data <- data.table(ID = 1:n_participants)
bis_data <- cbind(bis_data, as.data.table(bis_responses))
setnames(bis_data, old = paste0("V", 1:30), new = bis_items)

# Save dataset
write_csv(bis_data, "data/simulated/BIS_raw.csv")

# -------------------------------------------------
# 6. Simulate Aggression Data (BPAQ_raw.csv)
# -------------------------------------------------
# BPAQ is administered once during the pre-screening phase to establish a baseline measure of aggression
# Response Options (Likert scale, 1-5): (1) Extremely uncharacteristic of me, (2) Uncharacteristic of me, (3) Neither characteristic nor uncharacteristic
# (4) Characteristic of me, (5) Extremely characteristic of me
# Total Number of Items: 29

bpaq_items <- paste0("BPAQ_", 1:29)

# Generate a 50×29 matrix (one row per participant)
bpaq_responses <- matrix(
  sample(1:5, n_participants * 29, replace = TRUE),
  nrow = n_participants, ncol = 29
)

bpaq_data <- data.table(ID = 1:n_participants)
bpaq_data <- cbind(bpaq_data, as.data.table(bpaq_responses))
setnames(bpaq_data, old = paste0("V", 1:29), new = bpaq_items)


write_csv(bpaq_data, "data/simulated/BPAQ_raw.csv")


