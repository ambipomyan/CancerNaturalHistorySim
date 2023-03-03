# Prepare to the basic settings
volume              <- 100000
age_start           <- 40                     # 40 years old
lambda_onset        <- 0.2                    # 10 years in average 
lambda_sojourn_time <- 0.3                    # 05 years in average
progress            <- rbinom(volume, 1, 0.1)
age_tests           <- 50

# Init the data frame
onset        <- c(rep(age_start, volume) + rexp(volume, lambda_onset) * progress + (age_tests - age_start) * (1 - progress))
diagnostics  <- c(onset + rexp(volume, lambda_sojourn_time) * progress)

tests = -1 + (age_tests <= onset)*1 + ((age_tests > onset)*1) * ((age_tests <= diagnostics)*2)

df <- data.frame(onset_age = onset, clinical_age = diagnostics, tests = tests)
subdf <- subset(df, onset != age_tests)

# Test
#df
subdf

# Summary
total_truth       <- nrow(subdf)
TP                <- nrow(subset(subdf, tests ==  1))
FN                <- nrow(subset(subdf, tests ==  0))
passed_away_tests <- nrow(subset(subdf, tests == -1))
sensitivity       <- TP / (TP + FN)

df_sum <- data.frame(age = age_tests, total = volume, real = total_truth - passed_away_tests, TP = TP, FN = FN, sensitivity = sensitivity)
df_sum
