import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Circle

# Sample points representing core, border, and noise
core_points = np.array([[2, 2], [3, 2], [2.5, 2.8]])
border_points = np.array([[3.5, 2.2]])
noise_points = np.array([[5, 5]])

# Epsilon neighborhood radius
epsilon = 1.0

# Plotting
fig, ax = plt.subplots(figsize=(8, 6))

# Plot core points with circles
for i, point in enumerate(core_points):
    ax.scatter(*point, c='black', s=100, label='Core Point' if i == 0 else "")
    circle = Circle(point, epsilon, color='gray', alpha=0.2, linestyle='--')
    ax.add_patch(circle)

# Plot border points
ax.scatter(border_points[:, 0], border_points[:, 1], c='gray', s=100, label='Border Point')

# Plot noise points
ax.scatter(noise_points[:, 0], noise_points[:, 1], c='black', s=100, marker='x', label='Noise Point')

# Annotations
ax.annotate("Noise Point", noise_points[0] + np.array([0.2, 0.2]), color='black')
ax.annotate("Border Point", border_points[0] + np.array([0.2, -0.2]), color='gray')

# Plot settings
ax.set_xlim(0, 6)
ax.set_ylim(0, 6)
ax.set_aspect('equal')
ax.set_title('DBSCAN Geometric Intuition')
ax.legend()
plt.grid(True)
plt.show()
