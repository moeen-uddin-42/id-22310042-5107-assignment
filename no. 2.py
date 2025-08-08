import pandas as pd
import numpy as np
from sklearn.cross_decomposition import CCA

# --- Step 1: Create a sample DataFrame or read your Excel file ---

# Sample data with the same column names as the R code.
# You can replace this with your own Excel data.
data = {
    'Control': [10, 15, 12, 18, 11, 14, 16, 13, 17, 19],
    'Concept': [22, 25, 21, 28, 24, 26, 23, 27, 29, 20],
    'Motivation': [5, 8, 7, 9, 6, 8, 9, 7, 5, 6],
    'Read': [30, 35, 32, 38, 31, 34, 36, 33, 37, 39],
    'Write': [42, 45, 41, 48, 44, 46, 43, 47, 49, 40],
    'Math': [55, 58, 57, 59, 56, 58, 59, 57, 55, 56],
    'Science': [65, 68, 67, 69, 66, 68, 69, 67, 65, 66],
    'Sex': [1, 0, 1, 1, 0, 1, 0, 1, 0, 0]
}
df = pd.DataFrame(data)

# To use your own data from an Excel file, uncomment the line below and
# replace 'your_file.xlsx' with your file's name.
# Make sure the column names match those in the sample data.
# df = pd.read_excel('your_file.xlsx')

# --- Step 2: Separate the variables into two sets ---

# Psychological variables
psych = df[['Control', 'Concept', 'Motivation']]

# Academic variables
acad = df[['Read', 'Write', 'Math', 'Science']]

# --- Step 3: Perform Canonical Correlation Analysis (CCA) ---

# Initialize the CCA model. You can specify the number of components.
# Here we'll use n_components=1 to find the first canonical pair.
cca_model = CCA(n_components=1)

# Fit the model and transform the data
cca_model.fit(psych, acad)

# --- Step 4: Find Canonical Correlations and Coefficients ---

# Canonical correlations
# This is a bit manual, we will compute them from the transformed data
X_c, Y_c = cca_model.transform(psych, acad)
canonical_corr = np.corrcoef(X_c.T, Y_c.T)[0, 1]

# Canonical Coefficients (unstandardized)
x_coeffs = cca_model.x_weights_
y_coeffs = cca_model.y_weights_

print("Canonical Correlation Analysis Results:")
print(f"Canonical Correlation (1st component): {canonical_corr:.4f}")
print("\nPsychological Canonical Coefficients (unstandardized):")
print(x_coeffs)
print("\nAcademic Canonical Coefficients (unstandardized):")
print(y_coeffs)
