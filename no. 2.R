# --- Step 1: Create the sample data frame ---

# Create vectors for each column
Control <- c(10, 15, 12, 18, 11, 14, 16, 13, 17, 19)
Concept <- c(22, 25, 21, 28, 24, 26, 23, 27, 29, 20)
Motivation <- c(5, 8, 7, 9, 6, 8, 9, 7, 5, 6)
Read <- c(30, 35, 32, 38, 31, 34, 36, 33, 37, 39)
Write <- c(42, 45, 41, 48, 44, 46, 43, 47, 49, 40)
Math <- c(55, 58, 57, 59, 56, 58, 59, 57, 55, 56)
Science <- c(65, 68, 67, 69, 66, 68, 69, 67, 65, 66)
Sex <- c(1, 0, 1, 1, 0, 1, 0, 1, 0, 0)

# Combine vectors into a data frame
df <- data.frame(Control, Concept, Motivation, Read, Write, Math, Science, Sex)

# --- Step 2: Separate the variables into two sets ---

# Psychological variables
psych <- df[, c("Control", "Concept", "Motivation")]

# Academic variables
acad <- df[, c("Read", "Write", "Math", "Science")]

# --- Step 3: Perform Canonical Correlation Analysis (CCA) ---

# The cancor() function from the built-in 'stats' package performs CCA.
# It takes two matrices as input. We scale them to get standardized results,
# which is a common practice.
cca_results <- cancor(scale(psych), scale(acad))

# --- Step 4: Display Canonical Correlations and Coefficients ---

# The 'cor' element contains the canonical correlations
canonical_corr <- cca_results$cor

# The 'xcoef' and 'ycoef' elements contain the canonical coefficients
x_coeffs <- cca_results$xcoef
y_coeffs <- cca_results$ycoef

# Print the results
print("Canonical Correlation Analysis Results:")

# The cancor function computes all possible canonical correlations.
# The first one is the most significant.
cat("\nCanonical Correlations:\n")
print(canonical_corr)

# Print the coefficients for the psychological variables
cat("\nPsychological Canonical Coefficients (standardized):\n")
print(x_coeffs)

# Print the coefficients for the academic variables
cat("\nAcademic Canonical Coefficients (standardized):\n")
print(y_coeffs)

