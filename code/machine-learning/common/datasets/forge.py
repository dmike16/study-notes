import numpy as np
from sklearn import datasets


def make():
    X, y = datasets.make_blobs(n_samples=30, centers=2, random_state=4)
    y[np.array([7, 27])] = 0
    mask = np.ones(len(X), dtype=np.bool)
    mask[np.array([0, 1, 5, 26])] = 0
    X, y = X[mask], y[mask]
    return X, y
