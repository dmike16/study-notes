from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from common.datasets import boston

X, y = boston.make()
X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=0)

lr = LinearRegression().fit(X_train, y_train)

print("Training score {:.2f}".format(lr.score(X_train, y_train)))
print("Test score {:.2f}".format(lr.score(X_test, y_test)))
