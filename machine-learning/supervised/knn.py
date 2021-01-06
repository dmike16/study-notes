import matplotlib.pyplot as plt
from common.datasets import cancer
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier

realD = cancer.make()
X_train, X_test, y_train, y_test = train_test_split(
    realD.data, realD.target, stratify=realD.target, random_state=66)
traing_acc = []
test_acc = []
n_settings = range(1, 11)

for nn in n_settings:
    knn = KNeighborsClassifier(n_neighbors=nn).fit(X_train, y_train)
    traing_acc.append(knn.score(X_train, y_train))
    test_acc.append(knn.score(X_test, y_test))

plt.plot(n_settings, traing_acc, label="training acc")
plt.plot(n_settings, test_acc, label="test acc")
plt.ylabel("Accuracy")
plt.xlabel("n_neighbors")
plt.legend()
plt.show()
