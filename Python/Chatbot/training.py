import os
import random
import json
import pickle
import numpy as np

import nltk
from nltk.stem import WordNetLemmatizer

from tensorflow.keras.models import load_model, Sequential
from tensorflow.keras.layers import Dense, Activation, Dropout
from tensorflow.keras.optimizers import SGD

# Load WordNet lemmatizer
lemmatizer = WordNetLemmatizer()

# Load intents from JSON file
intents = json.loads(open('intents.json').read())

words = []
classes = []
documents = []

# Check if a pre-trained model exists
if os.path.exists('chatbot_model.h5'):
    # Load the existing model
    model = load_model('chatbot_model.h5')
else:
    # Iterate through intents and patterns to extract words and classes
    for intent in intents['intents']:
        for pattern in intent['patterns']:
            word_list = nltk.word_tokenize(pattern)
            words.extend(word_list)
            documents.append((word_list, intent['tag']))
            if intent['tag'] not in classes:
                classes.append(intent['tag'])

    # Lemmatize and remove duplicate words
    words = [lemmatizer.lemmatize(word.lower()) for word in words if word.isalpha()]
    words = sorted(set(words))

    # Remove duplicate classes
    classes = sorted(set(classes))

    # Save words and classes to pickle files
    pickle.dump(words, open('words.pkl', 'wb'))
    pickle.dump(classes, open('classes.pkl', 'wb'))

    # Prepare training data
    training = []
    output_empty = [0] * len(classes)

    for document in documents:
        bag = []
        word_patterns = document[0]
        word_patterns = [lemmatizer.lemmatize(word.lower()) for word in word_patterns]
        for word in words:
            bag.append(1) if word in word_patterns else bag.append(0)

        output_row = list(output_empty)
        output_row[classes.index(document[1])] = 1
        training.append([bag, output_row])

    # Shuffle the training data
    random.shuffle(training)

    # Separate features (X) and labels (y)
    train_x = np.array([bag for bag, _ in training])
    train_y = np.array([output_row for _, output_row in training])

    # Define the neural network model
    model = Sequential()
    model.add(Dense(128, input_shape=(len(train_x[0]),), activation='relu'))
    model.add(Dropout(0.5))
    model.add(Dense(64, activation='relu'))
    model.add(Dropout(0.5))
    model.add(Dense(len(train_y[0]), activation='softmax'))

    # Compile the model
    sgd = SGD(learning_rate=0.01, momentum=0.9, nesterov=True)
    model.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=['accuracy'])

    # Train the model
    hist = model.fit(np.array(train_x), np.array(train_y), epochs=200, batch_size=5, verbose=0)

    # Save the trained model
    model.save('chatbot_model.h5', hist)
    print('Model trained and saved.')



# Continue with your chatbot code...
# ...

