# --- Part 1: Exploratory Factor Analysis (EFA) with factanal() ---
# This example uses the base R function factanal() on the mtcars dataset.
library(FactoMineR)
# Load the dataset
data(mtcars)

# Perform a simple factor analysis with 3 factors and varimax rotation
# The factanal() function is well-suited for a clear, model-based approach.
cat("--- EFA with factanal() on mtcars ---\n")
factor_analysis_factanal <- factanal(mtcars,
                                     factors = 3,
                                     rotation = "varimax")
print(factor_analysis_factanal)


# --- Part 2: Exploratory Factor Analysis (EFA) with psych::fa() ---
# This is a more detailed EFA using the powerful 'psych' package on the iris dataset.

# Install required packages if you haven't already
# install.packages("psych")
# install.packages("factoextra")
library(psych)
library(factoextra)

# Load and prepare the iris dataset
data(iris)
# We only use the numeric columns for the analysis
iris_numeric <- iris[, 1:4]
iris_scaled <- scale(iris_numeric)

# 2a: Determine the number of factors using eigenvalues (Kaiser Criterion)
cat("\n--- Determining Number of Factors for Iris Dataset ---\n")
eigenvalues <- eigen(cor(iris_scaled))$values
print("Eigenvalues:")
print(eigenvalues)

# 2b: Conduct the EFA using the fa() function from the psych package
# We'll use 2 factors based on the eigenvalues > 1 criterion.
cat("\n--- EFA with psych::fa() on iris ---\n")
efa_result_iris <- fa(r = iris_scaled,
                      nfactors = 2,
                      rotate = "varimax")
print(efa_result_iris)


# --- Part 3: Confirmatory Factor Analysis (CFA) with lavaan ---
# This example demonstrates a CFA on a classic dataset.

# Install the package if needed
# install.packages("lavaan")
library(lavaan)

# Load the Holzinger and Swineford dataset
data(HolzingerSwineford1939)

# Define the model structure based on theory.
# We hypothesize three latent factors: visual, textual, and speed.
cfa_model <- '
  visual  =~ x1 + x2 + x3
  textual =~ x4 + x5 + x6
  speed   =~ x7 + x8 + x9
'

# Run the CFA
cat("\n--- CFA with lavaan Package ---\n")
cfa_result <- cfa(cfa_model, data = HolzingerSwineford1939)

# Print a summary of the results, including fit measures and parameter estimates
summary(cfa_result, fit.measures = TRUE, standardized = TRUE)


# --- Part 4: Multiple Factor Analysis (MFA) with FactoMineR ---
# Install and load the package if you haven't already
# install.packages("FactoMineR")
library(FactoMineR)

# --- Step 1: Load the dataset ---
data(wine)

# --- Step 2: Select the columns for the desired groups ---
# The 'wine' dataset has groups of variables for different sensory attributes.
# We will select the columns corresponding to "Odor" and "Taste".
# - Odor variables are in columns 3 through 7 (5 variables)
# - Taste variables are in columns 17 through 21 (5 variables)
wine_subset <- wine[, c(3:7, 17:21)]

# --- Step 3: Run MFA on the subset ted data ---
# Now, the group definition c(5, 5) perfectly matches our 10-column dataset.
mfa_result <- MFA(wine_subset,
                  group = c(5, 5),               # Define the groups: 5 for Odor, 5 for Taste
                  type = c("s", "s"),             # 's' for scaled numeric data for both groups
                  name.group = c("Odor", "Taste"), # Names for the groups
                  graph = FALSE)                  # Suppress the automatic plot

# --- Step 4: View the results ---
# Print a summary of the MFA results
cat("--- MFA Results Summary ---\n")
summary(mfa_result)
