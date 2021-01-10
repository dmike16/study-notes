from sklearn.datasets import load_breast_cancer

def make():
    bc = load_breast_cancer()
    return bc['data'], bc['target']