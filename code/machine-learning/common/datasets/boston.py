from sklearn.datasets import load_boston
from sklearn.preprocessing import MinMaxScaler, PolynomialFeatures

def make():
    bst = load_boston()
    X = bst['data']

    X = MinMaxScaler().fit_transform(bst['data'])
    X = PolynomialFeatures(degree=2, include_bias=False).fit_transform(X)

    return X, bst['target']