"""
Author: Johan Ericsson
Date: 2022-04-19
"""

import matplotlib.pyplot as plt
from matplotlib import rcParams
import pandas as pd

df = pd.read_csv('dft_omp.txt', skiprows=1, header=None, index_col=0)
df.index.name=None
indices = df.index
avg = df.mean(axis=1)
std = df.std(axis=1)


print(avg)
print(std)
# Font size Update
rcParams.update({'font.size': 20})
xlabel = "Threads"
ylabel = "Execution time (s)"

fig, ax = plt.subplots(figsize=(16, 10))
title = "DFT execution times with varying number of threads"
ax.set_xlabel(xlabel)
ax.set_ylabel(ylabel)
fig.suptitle(title)

plt.grid(True, which="both")
#ax.set_xticks(N, minor=True)
ax.errorbar(indices, avg, yerr=std, marker='o', linestyle=":", linewidth=2.0, elinewidth=2.0, label='DFT execution time')
#ax.plot(avg, marker='o', linestyle=":", linewidth=2.0, label='nbody reduced (simple estimate)') # simple model
ax.legend()
fig.tight_layout()
fig.savefig("../figures/dft_omp.pdf", format="pdf")
plt.show()
