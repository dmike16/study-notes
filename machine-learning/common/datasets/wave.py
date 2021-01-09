import numpy as np

def make(n_sample=100):
    rnd = np.random.RandomState(42)
    x = rnd.uniform(-3, 3, size=n_sample)
    y_no_noise = (np.sin(4*x) + x)
    y = (y_no_noise + rnd.normal(size=len(x))) / 2
    return x.reshape(-1, 1), y
