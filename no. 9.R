# In this example, we will perform Correspondence Analysis on the "USArrests" data set, which contains statistics on
# arrests made in each of the 50 US states in 1973. This data set is quantitative, making it suitable for Correspondence
# Analysis.

# --- Using FactoMineR package ---
install.packages("FactoMineR")
library(FactoMineR)

data("USArrests")
result = CA(USArrests)

# --- Visualize the Results ---
# To visualize the results, we will use the "factoextra" package to create a biplot with the results of the Correspondence Analysis.
# To install the "factoextra" package, use the following code:
install.packages("factoextra")
library(factoextra)

fviz_ca_biplot(result, repel = TRUE)

# --- Using ca package ---
# We'll again use the "USArrests" data set, which contains statistics on arrests made in each of the 50 US states in 1973
# perform correspondence analysis
install.packages("ca")
library(ca)
res.ca <- ca(USArrests, graph = FALSE)

# --- Extract Eigenvalues and Create a Scree Plot ---
# extract eigenvalues
eig <- get_eigenvalue(res.ca)
eig

# visualize eigenvalues
fviz_eig(res.ca)

# --- Row and column profiles ---
row.profiles <- get_ca_row(res.ca)
row.profiles

col.profiles <- get_ca_col(res.ca)
col.profiles

# --- Visualization of Row and Column Profiles ---
fviz_ca_row(res.ca)
fviz_ca_col(res.ca)

# --- Create a Biplot ---
# We can also create a biplot to visualize the relationship between the rows and columns of the analysis.
# And from the previous example, we know that fviz_ca_biplot() function creates a scatter plot of the rows and columns of the analysis
# with arrows indicating the strength and direction of the relationship between them.
fviz_ca_biplot(res.ca)

