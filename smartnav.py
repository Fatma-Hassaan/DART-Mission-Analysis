import numpy as np
import matplotlib
matplotlib.use('TkAgg')  # or 'Qt5Agg', depending on your system
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

# Constants
distance_km = 1180
period_pre_min = 11 * 60 + 55
period_post_min = 11 * 60 + 23
T_pre = period_pre_min * 60
T_post = period_post_min * 60

# Angular velocities
omega_pre = 2 * np.pi / T_pre
omega_post = 2 * np.pi / T_post

# Time setup
frames = 500
t = np.linspace(0, 1, frames)  # normalized time [0, 1]

# Prepare figure
fig, ax = plt.subplots(figsize=(8, 8))
ax.set_xlim(-1300, 1300)
ax.set_ylim(-1300, 1300)
ax.set_title('DART Mission: Orbit Animation (Pre vs Post Impact)')
ax.set_xlabel('X position (km)')
ax.set_ylabel('Y position (km)')
ax.grid(True)
ax.set_aspect('equal')

# Plot base elements
didymos = ax.plot(0, 0, 'yo', markersize=10, label='Didymos')[0]
orbit_pre, = ax.plot([], [], 'b--', label='Pre-impact orbit')
orbit_post, = ax.plot([], [], 'r-', label='Post-impact orbit')
dot_pre, = ax.plot([], [], 'bo', label='Dimorphos (Pre)')
dot_post, = ax.plot([], [], 'ro', label='Dimorphos (Post)')
ax.legend()

# Data storage
theta_pre = omega_pre * t * T_pre
theta_post = omega_post * t * T_post

x_pre_full = distance_km * np.cos(theta_pre)
y_pre_full = distance_km * np.sin(theta_pre)
x_post_full = distance_km * np.cos(theta_post)
y_post_full = distance_km * np.sin(theta_post)

# Animation update
def update(frame):
    orbit_pre.set_data(x_pre_full[:frame], y_pre_full[:frame])
    orbit_post.set_data(x_post_full[:frame], y_post_full[:frame])
    dot_pre.set_data(x_pre_full[frame], y_pre_full[frame])
    dot_post.set_data(x_post_full[frame], y_post_full[frame])
    return orbit_pre, orbit_post, dot_pre, dot_post

# Animate
ani = FuncAnimation(fig, update, frames=frames, interval=30, blit=True)
ani.save('orbit_animation.mp4', writer='ffmpeg')
plt.show()
