# --- Step 1: Installation and Library Imports ---
# Ensure the necessary package is installed. Uncomment the line below if needed.
# !pip install factor_analyzer

import pandas as pd
from factor_analyzer import FactorAnalyzer
from factor_analyzer.factor_analyzer import calculate_bartlett_sphericity, calculate_kmo
import matplotlib.pyplot as plt

# --- Step 2: Load Data ---
# Load your dataset from a CSV file. Replace 'your_data.csv' with your file path.
# For this example, we'll create a sample dataframe.
# In a real scenario, you would use: data = pd.read_csv('your_data.csv')
sample_data = {
    'v1': [2.5, 3.0, 2.8, 3.2, 3.1, 2.9, 3.5, 3.3, 2.7, 3.4],
    'v2': [1.9, 2.2, 2.1, 2.5, 2.3, 2.0, 2.6, 2.4, 1.8, 2.7],
    'v3': [4.1, 4.5, 4.3, 4.8, 4.6, 4.0, 4.9, 4.7, 4.2, 4.4],
    'v4': [3.8, 4.0, 3.9, 4.2, 4.1, 3.7, 4.3, 4.4, 3.6, 4.5],
    'v5': [2.2, 2.6, 2.4, 2.7, 2.5, 2.1, 2.8, 2.6, 2.3, 2.9],
    'v6': [5.0, 5.2, 5.1, 5.5, 5.3, 4.9, 5.6, 5.4, 4.8, 5.7]
}
data = pd.DataFrame(sample_data)


# --- Step 3: Assess Data Suitability for Factor Analysis ---
# Bartlett's test checks if variables are related enough to be suitable for structure detection.
chi_square_value, p_value = calculate_bartlett_sphericity(data)
print(f"Bartlett's test: Chi-square value: {chi_square_value:.2f}, p-value: {p_value:.3f}")

# The Kaiser-Meyer-Olkin (KMO) test measures the proportion of variance among variables
# that might be common variance. Values closer to 1.0 are better.
kmo_all, kmo_model = calculate_kmo(data)
print(f"KMO Test: {kmo_model:.2f}")
print("-" * 50)


# --- Step 4: Determine the Number of Factors ---
# Create a factor analysis object without specifying rotation to check eigenvalues.
fa_initial = FactorAnalyzer()
fa_initial.fit(data)

# Get the eigenvalues to help decide how many factors to retain.
eigen_values, _ = fa_initial.get_eigenvalues()
print("Eigenvalues:")
print(eigen_values)

# A Scree Plot visualizes the eigenvalues. The "elbow" of the plot is often
# used as a cutoff point for the number of factors.
plt.figure(figsize=(8, 5))
plt.scatter(range(1, data.shape[1] + 1), eigen_values)
plt.plot(range(1, data.shape[1] + 1), eigen_values)
plt.title('Scree Plot')
plt.xlabel('Factors')
plt.ylabel('Eigenvalue')
plt.grid()
plt.show()


# --- Step 5: Perform Factor Analysis with a Determined Number of Factors ---
# Based on the scree plot or Kaiser Criterion (eigenvalues > 1), we choose the number of factors.
# Let's assume we choose 2 factors for this example.
fa = FactorAnalyzer(n_factors=2, rotation="varimax")
fa.fit(data)


# --- Step 6: Interpret the Results ---
# Get the factor loadings, which show the correlation of each variable with each factor.
loadings = pd.DataFrame(fa.loadings_, index=data.columns, columns=['Factor 1', 'Factor 2'])
print("\nFactor Loadings:")
print(loadings)

# Get the variance explained by each factor.
variance = pd.DataFrame(fa.get_factor_variance(), index=['SS Loadings', 'Proportion Var', 'Cumulative Var'], columns=['Factor 1', 'Factor 2'])
print("\nFactor Variance:")
print(variance)

# Get the factor scores for each observation.
# factor_scores = fa.transform(data)
# print("\nFactor Scores (first 5 rows):")
# print(pd.DataFrame(factor_scores).head())
