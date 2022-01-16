import matplotlib.pyplot as plt
import numpy as np
from common.datasets import wave
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsRegressor
from common.plot import cm2

X, y = wave.make(40)
X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=0)

fig, axes = plt.subplots(1, 3, figsize=(15, 4))
line = np.linspace(-3, 3, 1000).reshape(-1, 1)
for nn, ax in zip([1,3,9], axes):
    reg = KNeighborsRegressor(n_neighbors=nn).fit(X_train, y_train)
    ax.plot(line, reg.predict(line))
    ax.plot(X_train, y_train, '^', c=cm2(0), markersize=8)
    ax.plot(X_test, y_test, 'v', c=cm2(1), markersize=8)

    ax.set_title(
        "{} neighbor(s)\n train score: {:.2f} test score: {:.2f}".format(
            nn, reg.score(X_train, y_train), reg.score(X_test, y_test)
        )
    )
    ax.set_xlabel("Feature")
    ax.set_ylabel("Target")

axes[0].legend(["Model prediction", "Training data/target", "Test data/target"], loc="best")
plt.show()