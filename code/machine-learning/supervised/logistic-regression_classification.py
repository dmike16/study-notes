from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from common.datasets import cancer

X, y = cancer.make()
X_train, X_test, y_train, y_test = train_test_split(
    X, y, stratify=y, random_state=42)

print("------- L2 ----- ")
for C in [0.001, 1, 100]:
    logreg = LogisticRegression(max_iter=10000, C=C).fit(X_train, y_train)
    print("C = {}".format(C))
    print("Training score {:.3f}".format(logreg.score(X_train, y_train)))
    print("Test score {:.3f}".format(logreg.score(X_test, y_test)))

print("------- L1 ----- ")
for C in [0.001, 1, 100]:
    logreg = LogisticRegression(
        max_iter=10000, C=C, penalty="l1", solver="liblinear").fit(X_train, y_train)
    print("C = {}".format(C))
    print("Training score {:.3f}".format(logreg.score(X_train, y_train)))
    print("Test score {:.3f}".format(logreg.score(X_test, y_test)))
