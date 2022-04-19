"""
Author: Johan Ericsson
Date: 2022-04-19
"""
import matplotlib.pyplot as plt
from matplotlib import rcParams


#f_name = 'criticalsum_results.txt'
#f_name = 'local_sum_results.txt'
f_name = 'local_sum_padded_results.txt'

with open(f_name) as f:
    words = f.read().split()

n_threads = []
mean = []
std_dev = []
print(words)

for i, s in enumerate(words):
    if 'THREADS:' == s:
        n_threads.append(int(words[i+1]))
    if 'mean:' == s:
        mean.append(float(words[i+1]))
    if 'deviation:' == s:
        std_dev.append(float(words[i+1]))

rcParams.update({'font.size': 20})
xlabel = "Threads"
ylabel = "Execution Time (ms)"

fig, ax = plt.subplots(figsize=(16, 10))
#title = "Critical Sum Execution Times"
#title = "Local Sum Execution Times"
title = "Local Sum Padded Execution Times"
ax.set_xlabel(xlabel)
ax.set_ylabel(ylabel)
fig.suptitle(title)

plt.grid(True, which="both")
ax.set_xticks(n_threads, minor=True)
ax.errorbar(n_threads, mean, yerr=std_dev, marker='o', linestyle=":", linewidth=2.0, elinewidth=2.0,
            label='omp local sum implementation')
ax.legend()
fig.tight_layout()
#fig.savefig("../figures/omp_critical_sum.pdf", format="pdf")
#fig.savefig("../figures/omp_local_sum.pdf", format="pdf")
fig.savefig("../figures/omp_local_sum_padded.pdf", format="pdf")
plt.show()
