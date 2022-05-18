"""
Author: Johan Ericsson
Date: 2022-05-16
"""

import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rcParams

def load_data(file_path):
    with open(file_path) as f:
        data = f.read().split()
    assert len(data) % 2 == 0, "Ill formatted data, rows differ per column"
    size = []
    time = []
    for i in range(0, len(data), 2):
        size.append(float(data[i]))
        time.append(float(data[i+1]))
    return np.array(size), np.array(time)


if __name__ == '__main__':
    file_path = 'on_node.txt'
    sizes, times = load_data(file_path)
    print(sizes)
    print(times)
    p = np.polyfit(sizes, times, deg=1)

    rcParams.update({'font.size': 20})
    title = 'Ping Pong Benchmark'
    xlabel = 'Buffer Size (B)'
    ylabel = 'Execution time (s)'
    fig, ax = plt.subplots(figsize=(16, 10))
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    #ax.set_xscale('log')
    plt.grid(True, which="both")
    #ax.set_xticks(sizes, minor=True)
    ax.plot(sizes, times, marker='o', linestyle="None", linewidth=2.0, label='measured time')
    ax.plot(sizes, p[0]*sizes+p[1], '--', label='polyfit' )
    ax.legend()
    fig.suptitle(title)
    fig.tight_layout()
    # fig.savefig("figures/stream_"+stream_type+".pdf", format="pdf")

    plt.show()
