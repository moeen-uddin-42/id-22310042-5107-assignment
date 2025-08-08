# --- Step 1: Load the MASS library for the isoMDS function ---
library(MASS)

# --- Step 2: Create an empty matrix for the dissimilarity data ---
World_war_Politicians_data_1 <- matrix(ncol = 12, nrow = 12)

# Assign names to the columns and rows
politician_names <- c("Hitler", "Mussolini", "Churchill", "Eisenhower", "Stalin", "Attlee", "Franco", "De_Gaulle", "Mao_Tse", "Truman", "Chamberlain", "Tito")
colnames(World_war_Politicians_data_1) <- politician_names
rownames(World_war_Politicians_data_1) <- politician_names

# --- Step 3: Populate the matrix with dissimilarity data ---
# Fill the lower triangle of the matrix with the provided dissimilarity scores.
World_war_Politicians_data_1[lower.tri(World_war_Politicians_data_1)] <- c(5, 11, 15, 8, 17, 5, 10, 16, 17, 12, 16, 14, 16, 13, 18, 3, 11, 18, 18, 14, 17, 7, 11, 11, 12, 5, 16, 8, 10, 8, 16, 16, 14, 8, 17, 6, 7, 12, 15, 13, 11, 12, 14, 16, 12, 16, 12, 16, 12, 9, 13, 9, 17, 16, 10, 12, 13, 9, 11, 7, 12, 17, 10, 9, 11, 15)

# Set the diagonal to zero
diag(World_war_Politicians_data_1) <- 0

# --- Step 4: Convert the matrix to a distance object ---
dist_politicians <- as.dist(World_war_Politicians_data_1)

# --- Step 5: Perform Non-Metric MDS ---
# The isoMDS() function is used for non-metric scaling.
NMMDS_1 <- isoMDS(dist_politicians, k = 2)

# --- Step 6: Plot the results ---
# Create an empty plot to place the labels on.
plot(NMMDS_1$points, type = "n", xlab = "", ylab = "", axes = FALSE)

# Add the politician names at their scaled coordinates.
text(NMMDS_1$points, labels = politician_names, cex = 0.9, xpd = TRUE)
