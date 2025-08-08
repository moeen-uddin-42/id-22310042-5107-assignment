# --- Step 1: Create an empty matrix and define its dimensions ---
# The matrix will hold the distance data between 10 U.S. cities.
Air_line_data_2 <- matrix(ncol = 10, nrow = 10)

# Assign city names to the columns and rows
colnames(Air_line_data_2) <- c("Atlanta", "Chicago", "Denver", "Houston", "Los_Angeles", "Miami", "New_York", "San_Francisco", "Seattle", "Washington_D.C")
rownames(Air_line_data_2) <- c("Atlanta", "Chicago", "Denver", "Houston", "Los_Angeles", "Miami", "New_York", "San_Francisco", "Seattle", "Washington_D.C")

# --- Step 2: Populate the matrix with distance data ---
# The distances are fed into the lower triangle of the matrix.
Air_line_data_2[lower.tri(Air_line_data_2)] <- c(587, 1212, 701, 1936, 604, 748, 2139, 2182, 543, 920, 940, 1745, 1188, 713, 1858, 1737, 597, 879, 831, 1726, 1631, 949, 1021, 1494, 1374, 968, 1420, 1645, 1891, 1220, 2339, 2451, 347, 959, 2300, 1092, 2594, 2734, 923, 2571, 2408, 205, 678, 2442, 2329)

# Set the diagonal to zero (distance from a city to itself is 0)
diag(Air_line_data_2) <- 0

# --- Step 3: Convert the matrix to a distance object ---
# The cmdscale function works with distance objects.
# We also reflect the lower triangle to the upper triangle to make it a full symmetric matrix.
dist_data <- as.dist(Air_line_data_2)

# --- Step 4: Perform Classical (Metric) MDS ---
# cmdscale() performs the scaling, reducing the data to k=2 dimensions.
MMDS_1 <- cmdscale(dist_data, k = 2)

# --- Step 5: Plot the results ---
# 'type="n"' creates an empty plot.
plot(MMDS_1[, 1], MMDS_1[, 2], type = "n", xlab = "", ylab = "", axes = FALSE, main = "cmdscale (stats)")

# 'text()' adds the city names to the plot at their new 2D coordinates.
text(MMDS_1[, 1], MMDS_1[, 2], labels = rownames(MMDS_1), cex = 0.9, xpd = TRUE)
