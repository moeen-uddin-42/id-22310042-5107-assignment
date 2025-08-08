# --- Step 1: Install and Load Required Packages ---
# You may need to install these packages if you haven't already.
install.packages("mlbench")
install.packages("dbscan")
install.packages("ggplot2")

library(mlbench)
library(dbscan)
library(ggplot2)

# --- Step 2: Generate Synthetic Data ---
# The mlbench.spirals() function can create a similar non-linear dataset.
# We'll use two spirals, which serve a similar purpose to the 'moons' dataset.
# `set.seed()` is the R equivalent of Python's `random_state`.
set.seed(42)
moons_data <- mlbench.spirals(n = 300, cycles = 1, sd = 0.1)
X <- moons_data$x

# --- Step 3: Standardize the Data ---
# The scale() function in R standardizes the data (mean=0, sd=1),
# similar to StandardScaler in scikit-learn.
X_scaled <- scale(X)

# --- Step 4: Apply DBSCAN Algorithm ---
# Use the dbscan() function.
# - eps = 0.3: Defines the radius of the neighborhood.
# - minPts = 5: The minimum number of points required for a core point.
dbscan_result <- dbscan(X_scaled, eps = 0.3, minPts = 5)

# --- Step 5: Plot the Results ---
# We use ggplot2 for a high-quality visualization.
# First, create a data frame for plotting.
plot_data <- data.frame(
  Feature1 = X_scaled[, 1],
  Feature2 = X_scaled[, 2],
  Cluster = as.factor(dbscan_result$cluster) # Convert cluster numbers to a factor for coloring
)

# Create the plot
ggplot(plot_data, aes(x = Feature1, y = Feature2, color = Cluster)) +
  geom_point(size = 3) +
  labs(
    title = "DBSCAN Clustering",
    x = "Feature 1",
    y = "Feature 2",
    color = "Cluster"
  ) +
  theme_bw() + # A clean black and white theme
  theme(plot.title = element_text(hjust = 0.5)) # Center the plot title
