import numpy as np
import matplotlib.pyplot as plt

# Reference radius (e.g. solar radius)
R = 1.0
MRs = [0, 0.01, 0.02, 0.03, 0.05]   # Different Rs/R values (strength of curvature)

# Define angle parameter (sin(phi))
sp = np.linspace(0.1, 1.0, 500)      # sin(phi)
cp = np.sqrt(1.0 - sp**2)            # cos(phi)

# --- Newtonian straight line (no deflection) ---
r_new = R / sp                       # radial distance
x_new = r_new * cp                   # x-coordinates
y_new = r_new * sp                   # y-coordinates

plt.plot(x_new, y_new, 'b', linewidth=1.5, label='Newtonian')
plt.plot(-x_new, y_new, 'b', linewidth=1.5)

# --- Approximate GR deflected orbits ---
for k in range(1, len(MRs)):         # start from 1 to skip Newtonian
    MR = MRs[k]
    
    # GR correction term
    uu = sp / R + (MR / R**2)
    
    r_GR = 1.0 / uu                  # radial distance in GR approx
    x_GR = r_GR * cp
    y_GR = r_GR * sp
    
    plt.plot(x_GR, y_GR, linewidth=1.2, label=f'GR: Rs/R={MR}')
    plt.plot(-x_GR, y_GR, linewidth=1.2)

# --- Labels and axis formatting ---
plt.title('Small Angle Orbits for Light, Newtonian and GR')
plt.xlabel('x/R')
plt.ylabel('y/R')
plt.axis([-10, 10, 0.6, 1.1])
plt.grid(True)
plt.legend()
plt.show()