import numpy as np
import matplotlib.pyplot as plt
from sklearn.svm import LinearSVC
from sklearn.datasets import make_blobs
from common.plot import discrete_scattered
from common.plot import cm3

X, y = make_blobs(random_state=42)
linear_svc = LinearSVC().fit(X, y)
discrete_scattered.plot(X[:, 0], X[:, 1], y)
line = np.linspace(-15, 15)

for w, b, color in zip(linear_svc.coef_, linear_svc.intercept_, cm3.colors):
    plt.plot(line, -(line * w[0] + b) / w[1], c=color)
plt.ylim(-10, 15)
plt.xlim(-10, 8)
plt.xlabel("Featue 0")
plt.ylabel("Feature 1")
plt.legend(["Class 0", "Class 1", "Class 2", "Line c0", "Line c1", "Line c2"],
           loc=(1.01, 0.3))
plt.show()
