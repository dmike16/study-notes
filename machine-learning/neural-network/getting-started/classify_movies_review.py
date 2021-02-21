import numpy as np
import matplotlib.pyplot as plt
from keras.datasets import imdb
from keras import models
from keras import layers
from keras import optimizers
from keras import losses
from keras import activations
from keras import metrics

# load imdb data set from keras
(train_data, train_labels), (test_data,
                             test_labels) = imdb.load_data(num_words=10000)

# vectrorize sequence


def vectrorize(sequences, dimension=10000):
    results = np.zeros((len(sequences), dimension))
    for i, sequence in enumerate(sequences):
        results[i, sequence] = 1
    return results


x_train = vectrorize(train_data)
x_test = vectrorize(test_data)

y_train = np.asarray(train_labels).astype('float32')
y_test = np.asarray(test_labels).astype('float32')

# create se set of validation data
x_val = x_train[:10000]
y_val = y_train[:10000]

x_partial_train = x_train[10000:]
y_partial_train = y_train[10000:]


model = models.Sequential()
model.add(models.Input((10000,)))
model.add(layers.Dense(16, activation=activations.relu))
model.add(layers.Dense(16, activation=activations.relu))
# model.add(layers.Dense(10, activation=activations.relu))
model.add(layers.Dense(1, activation=activations.sigmoid))
# summary of the network
model.summary()

model.compile(optimizer=optimizers.RMSprop(learning_rate=0.001),
              loss=losses.binary_crossentropy,
              metrics=[metrics.binary_accuracy])
# model.compile(optimizer=optimizers.RMSprop(learning_rate=0.001),
#               loss=losses.mse,
#               metrics=[metrics.binary_accuracy])

# validate data
# history = model.fit(x_partial_train, y_partial_train,
#                     epochs=20, batch_size=512, validation_data=(x_val, y_val))

# history_dict = history.history
# loss_values = history_dict['loss']
# val_loss_values = history_dict['val_loss']

# epochs = range(1, len(history_dict['binary_accuracy']) + 1)

# plt.plot(epochs, loss_values, 'bo', label='Training loss')
# plt.plot(epochs, val_loss_values, 'b', label='Validation loss')
# plt.title('Training and validation loss')
# plt.xlabel('Epochs')
# plt.ylabel('Loss')
# plt.legend()
# plt.show()

# plt.clf()
# acc_values = history_dict['binary_accuracy']
# val_acc_values = history_dict['val_binary_accuracy']
# plt.plot(epochs, acc_values, 'bo', label='Training acc')
# plt.plot(epochs, val_acc_values, 'b', label='Validation acc')
# plt.title('Training and validation accuracy')
# plt.xlabel('Epochs')
# plt.ylabel('Loss')
# plt.legend()
# plt.show()

# # train fron scratch
model.fit(x_train, y_train,
          epochs=5, batch_size=512)

results = model.evaluate(x_test, y_test)
print("Model results: ", results)
print("Model prediction: ", model.predict(x_test))
