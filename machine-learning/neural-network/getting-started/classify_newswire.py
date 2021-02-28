from keras.datasets import reuters
from keras import models
from keras import layers
from keras import activations
from keras import losses
from keras import metrics
from keras import optimizers
import numpy as np
import matplotlib.pyplot as plt

# load newswire data set from keras
(train_data, train_labels), (test_data,
                             test_labels) = reuters.load_data(num_words=10000)

print(len(train_data))
print(len(test_data))

# vectrorize sequence
def vectrorize(sequences, dimension=10000):
    results = np.zeros((len(sequences), dimension))
    for i, sequence in enumerate(sequences):
        results[i, sequence] = 1
    return results

x_train = vectrorize(train_data)
x_test = vectrorize(test_data)

# one hot encoding 
# 
# built in keras
# from keras.utils.np_utils import to_categorical
def to_one_hot(sequence, dimension = 46):
    results = np.zeros((len(sequence), dimension))
    for i , label in enumerate(sequence):
        results[i, label] = 1
    return results

one_hot_train_label = to_one_hot(train_labels)
one_hot_test_label = to_one_hot(test_labels)

# sequential dense model
model = models.Sequential()
model.add(models.Input((10000,)))
model.add(layers.Dense(128, activation=activations.relu))
model.add(layers.Dense(64, activation=activations.relu))
# model.add(layers.Dense(64, activation=activations.relu))
model.add(layers.Dense(46, activation = activations.softmax))

# summary of the network
model.summary()
model.compile(optimizer=optimizers.RMSprop(learning_rate=0.001),
              loss=losses.categorical_crossentropy,
              metrics=[metrics.categorical_accuracy])

# create se set of validation data
x_val = x_train[:1000]
y_val = one_hot_train_label[:1000]

x_partial_train = x_train[1000:]
y_partial_train = one_hot_train_label[1000:]

# validate data
# history = model.fit(x_partial_train, y_partial_train,
#                     epochs=20, batch_size=512, validation_data=(x_val, y_val))

# history_dict = history.history
# loss_values = history_dict['loss']
# val_loss_values = history_dict['val_loss']

# epochs = range(1, len(history_dict['categorical_accuracy']) + 1)

# plt.plot(epochs, loss_values, 'bo', label='Training loss')
# plt.plot(epochs, val_loss_values, 'b', label='Validation loss')
# plt.title('Training and validation loss')
# plt.xlabel('Epochs')
# plt.ylabel('Loss')
# plt.legend()
# plt.show()

# plt.clf()
# acc_values = history_dict['categorical_accuracy']
# val_acc_values = history_dict['val_categorical_accuracy']
# plt.plot(epochs, acc_values, 'bo', label='Training acc')
# plt.plot(epochs, val_acc_values, 'b', label='Validation acc')
# plt.title('Training and validation accuracy')
# plt.xlabel('Epochs')
# plt.ylabel('Loss')
# plt.legend()
# plt.show()

history = model.fit(x_partial_train, y_partial_train,
                    epochs=9, batch_size=512, validation_data=(x_val, y_val))
results = model.evaluate(x_test, one_hot_test_label)
print(results)
predictions = model.predict(x_test)
print(predictions[0].shape)
print(np.sum(predictions[0]))
print(np.argmax(predictions[0]))