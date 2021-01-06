import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt


def plot(x1, x2, y=None, ax=None):
    if ax is None:
        ax = plt.gca()
    if y is None:
        y = np.zeros(len(x1))

    uy = np.unique(y)

    markers = ['o', '^', 'v', 'D', 's', '*', 'p', 'h', 'H', '8', '<', '>'] * 10
    current_cycler = mpl.rcParams['axes.prop_cycle']

    for i, (yy, cycle) in enumerate(zip(uy, current_cycler())):
        mask = y == yy
        color = cycle['color']

        ax.plot(
            x1[mask], x2[mask], markers[i], markersize=10,
            label=uy[i], alpha=1, c=color,
            markeredgewidth=None, markeredgecolor="black"
        )
