from keras.datasets import boston_housing
from keras import models
from keras import layers
from keras import activations
from keras import optimizers
from keras import metrics
from keras import losses
import numpy as np
import matplotlib.pyplot as plt

(train_data, train_targets), (test_data, test_targets) = boston_housing.load_data()


mean = train_data.mean(axis=0)
train_data -= mean
std = train_data.std(axis=0)
train_data /= std

test_data -= mean
test_data /= std


print('training size', train_data.shape[1])


def build_model():
    model = models.Sequential()
    model.add(models.Input((train_data.shape[1],)))
    model.add(layers.Dense(64, activation=activations.relu))
    model.add(layers.Dense(64, activation=activations.relu))
    model.add(layers.Dense(1))

    model.compile(optimizer=optimizers.RMSprop(),
                  loss=losses.mse, metrics=[metrics.mae])
    return model


# Smooth curve of avarange result
def smooth_curve(points, factor=0.9):
    smothed_point = []
    for point in points:
        if smothed_point:
            previous = smothed_point[-1]
            smothed_point.append(previous * factor + point * (1-factor))
        else:
            smothed_point.append(point)

    return smothed_point


# K-FOLD validation
def validate():
    K = 4
    num_val_samples = len(train_data) // K
    num_epochs = 100
    all_scores = []
    for i in range(K):
        print('procession fold-{}'.format(i))
        val_data = train_data[i*num_val_samples: (i+1)*num_val_samples]
        val_targets = train_targets[i*num_val_samples: (i+1)*num_val_samples]

        partial_training_data = np.concatenate(
            [train_data[:i*num_val_samples],
             train_data[(i+1)*num_val_samples:]], axis=0
        )

        partial_train_targets = np.concatenate(
            [train_targets[:i*num_val_samples],
             train_targets[(i+1)*num_val_samples:]], axis=0
        )

        model = build_model()
        # summary of the network
        model.summary()
        history = model.fit(partial_training_data, partial_train_targets,
                            validation_data=(val_data, val_targets),
                            epochs=num_epochs, batch_size=1, verbose=0)
        all_scores.append(history.history['val_mean_absolute_error'])

    average_mae_history = [
        np.mean([x[i] for x in all_scores]) for i in range(num_epochs)
    ]

    smoothed_mae_history = smooth_curve(average_mae_history[10:])
    plt.plot(range(1, len(smoothed_mae_history) + 1), smoothed_mae_history)
    plt.xlabel('Epochs')
    plt.ylabel('Validation MAE')
    plt.show()


# validate()
model = build_model()
model.fit(train_data, train_targets, epochs=80, batch_size=16, verbose=0)
test_mse_score, test_mae_score = model.evaluate(test_data, test_targets)
print('scores', test_mae_score)
