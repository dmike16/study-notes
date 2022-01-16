import numpy as np
from sklearn.linear_model import Lasso
from sklearn.model_selection import train_test_split
from common.datasets import boston

X, y = boston.make()
X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=0)

lasso = Lasso(alpha=0.01, max_iter=100000).fit(X_train, y_train)

print("Training score {:.2f}".format(lasso.score(X_train, y_train)))
print("Test score {:.2f}".format(lasso.score(X_test, y_test)))
print("Number of feature used {}".format(np.sum(lasso.coef_ != 0)))