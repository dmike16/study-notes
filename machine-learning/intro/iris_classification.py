from sklearn.datasets import load_iris
from pandas import plotting as pd_plotting
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


# load datasets
iris_dataset = load_iris()
print("Iris keys: ", iris_dataset.keys())
print("Target names: ", iris_dataset['target_names'])
print("Feature_name: ", iris_dataset['feature_names'])
print("Target: ", type(iris_dataset['target']))
print("Data: ", type(iris_dataset['data']))
print("Data shape: ", iris_dataset['data'].shape)

# shufflte + split data in training_set + test_set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(iris_dataset['data'], iris_dataset['target'], random_state=0)
print("Train data shape: ", np.array(X_train).shape)
print("Train labels shap: ", np.array(y_train).shape)
print("Test data shape: ", np.array(X_test).shape)
print("Test label shape: ", np.array(y_test).shape)

from common.plot import cm3
iris_dataframe = pd.DataFrame(X_train, columns=iris_dataset.feature_names)
pd_plotting.scatter_matrix(iris_dataframe, c=y_train, figsize=(15,15),
        marker='o', hist_kwds={'bins': 20}, s=60, alpha=.8, cmap=cm3)

#plt.show()

from sklearn.neighbors import KNeighborsClassifier
knn = KNeighborsClassifier(n_neighbors=1)
knn.fit(X_train, y_train)
print("k-nearest algo: ", knn)
y_pred = knn.predict(X_test)
print("Test set predition: ", y_pred)
print("Score prediction: {:.2f}".format(np.mean(y_pred == y_test)))
print("Score prediction: {:.2f}".format(knn.score(X_test, y_test)))
