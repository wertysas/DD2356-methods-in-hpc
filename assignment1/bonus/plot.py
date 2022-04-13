
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rcParams


c = 0.294*1e-9 # clock cycle in seconds
bw = 20000*1e6 # B/s
w = r = 1/bw

def simple_model(N):
    return 59*(N*N-N)*c + 20*N*c

def reduced_model(N):
    return 31.5*(N*N-N)*c + 20*N*c*c

def move_advanced(N):
    return N*(20*c + 80*w)

def simple_advanced(N):
    return N*(N-1)*((2*17+25)*c + 80*w) + move_advanced(N)

def reduced_advanced(N):
    mov = move_advanced(N)
    return N*(N-1)*((19+12.5)*c + 14*8*w)+mov


# Measurement Results
N = [500, 1000, 2000]
nbody_t = [0.0407162, 0.16120819, 0.63533226]
nbody_var = [0.00000001, 0.00000022, 0.00000319]
nbody_std = np.sqrt(np.array(nbody_var))
nbodysimple_t = [0.0501300, 0.19841920, 0.82404189]
nbodysimple_var = [0.00000002, 0.00000094, 0.00010302]
nbodysimple_std = np.sqrt(np.array(nbody_var))




rcParams.update({'font.size': 20})
xlabel = 'Number of particles: N'
ylabel = 'Execution time (s)'
fig, ax = plt.subplots(figsize=(16, 10))
title = 'N-body simulation execution times'
ax.set_xlabel(xlabel)
ax.set_ylabel(ylabel)
plt.grid(True, which="both")
ax.set_xticks(N, minor=True)
ax.errorbar(N, nbody_t, yerr=nbody_std, marker='o', linestyle=":", linewidth=2.0, label='nbody reduced')
ax.errorbar(N, nbodysimple_t, yerr=nbodysimple_std, marker='^', linestyle=":", linewidth=2.0, label='nbody simple')
ax.plot(N, [reduced_model(n) for n in N], marker='o', linestyle=":", linewidth=2.0, label='nbody reduced (simple estimate)') # simple model
ax.plot(N, [simple_model(n) for n in N], marker='^', linestyle=":", linewidth=2.0, label='nbody simple (simple estimated') # simple model
ax.plot(N, [reduced_advanced(n) for n in N], marker='o', linestyle=":", linewidth=2.0, label='nbody reduced (advanced estimate)') # advanced model
ax.plot(N, [simple_advanced(n) for n in N], marker='^', linestyle=":", linewidth=2.0, label='nbody simple (advanced estimated') # advanced model
ax.legend()
fig.suptitle(title)
fig.tight_layout()
#fig.savefig("figures/stream_"+stream_type+".pdf", format="pdf")
plt.show()







