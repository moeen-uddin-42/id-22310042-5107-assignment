
import prince
import pandas as pd
import matplotlib.pyplot as plt

# --- Step 1: Load the Dataset ---
url = "https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/USArrests.csv"
df = pd.read_csv(url, index_col=0)

# --- Step 2: Perform Correspondence Analysis ---
ca = prince.CA(
    n_components=2,
    n_iter=3,
    copy=True,
    check_input=True,
    random_state=42
)
ca = ca.fit(df)

# --- Step 3: Manually Create the Scree Plot ---
# This section replaces the old ca.scree_plot()
explained_variance = ca.percentage_of_variance_
dims = [f"Dim {i+1}" for i in range(len(explained_variance))]

plt.figure(figsize=(8, 5))
plt.bar(dims, explained_variance, color='steelblue')
plt.ylabel('Percentage of Variance')
plt.xlabel('Dimensions')
plt.title('Scree Plot')
plt.ylim(0, 100) # Set y-axis to go up to 100%
plt.show()


# --- Step 4: Row and Column Profiles (Coordinates) ---
print("\nRow Coordinates:")
print(ca.row_coordinates(df).head())

print("\nColumn Coordinates:")
print(ca.column_coordinates(df).head())


# --- Step 5: Create a Biplot ---
ax = ca.plot(
    df,
    x_component=0,
    y_component=1,
    show_row_labels=True,
    show_col_labels=True
)
ax.set_title('Correspondence Analysis Biplot of USArrests')
plt.show()
