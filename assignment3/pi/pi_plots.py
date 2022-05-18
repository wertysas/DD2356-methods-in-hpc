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


def plot_ping_pong_data(file_path, skip_first=0, title='', save_fig=False):

    sizes, times = load_data(file_path)
    sizes=sizes[skip_first:]
    times=times[skip_first:]

    p = np.polyfit(sizes, times, deg=1)
    print('='*80)
    print(title)
    print("polyfit:", p)
    print("bandwidth:", 1.0/p[0])
    print("latency:", p[1])

    rcParams.update({'font.size': 20})
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

    if save_fig :
        #fig.savefig("/home/tailor/code/KTH/DD2356-methods-in-hpc/assignment3/figures/"+file_path.replace('txt', 'pdf'), format='pdf')
        fig.savefig("../figures/"+file_path.replace('txt', 'pdf'), format='pdf')

    plt.show()


if __name__ == '__main__':
    SAVE_FIG = False

    file_path = 'on_node.txt'
    plot_ping_pong_data(file_path, skip_first=6, title="Ping Pong - on node communication", save_fig=SAVE_FIG)

    file_path = 'on_node_one_sided.txt'
    plot_ping_pong_data(file_path, skip_first=6, title="Ping Pong - one sided on node communication", save_fig=SAVE_FIG)

    file_path = 'out_of_node.txt'
    plot_ping_pong_data(file_path, skip_first=6, title="Ping Pong - out of node communication", save_fig=SAVE_FIG)

    file_path = 'out_of_node_one_sided.txt'
    plot_ping_pong_data(file_path, skip_first=6, title="Ping Pong - one sided out of node communication", save_fig=SAVE_FIG)
