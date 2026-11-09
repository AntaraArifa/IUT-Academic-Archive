"""
CSE 4802 Lab 3 - Transformation Tools
Project: Heart Disease Prediction
Tools used: Loguru, PySnooper, VizTracer, SnakeViz

Run normally:
    python lab3_heart_disease_tools.py

Run with VizTracer:
    python -m viztracer -o outputs/viztracer_result.html lab3_heart_disease_tools.py

Run with SnakeViz:
    python -m cProfile -o outputs/profile_output.profile lab3_heart_disease_tools.py
    python -m snakeviz outputs/profile_output.profile
"""

import os
import sys
import numpy as np
import pandas as pd
import pysnooper
from loguru import logger
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score


# Create folders for lab outputs
os.makedirs("logs", exist_ok=True)
os.makedirs("outputs", exist_ok=True)


# -----------------------------
# Loguru Configuration
# -----------------------------
logger.remove()

# Console logging
logger.add(sys.stderr, level="INFO")

# File logging
logger.add(
    "logs/loguru_output.log",
    format="{time:YYYY-MM-DD HH:mm:ss} | {level} | {message}",
    level="DEBUG",
    diagnose=False
)


def load_dataset(file_path: str = "heart_disease_data.csv") -> pd.DataFrame:
    """Load heart disease dataset from CSV file."""
    logger.info("Loading dataset")
    heart_data = pd.read_csv(file_path)

    logger.success("Dataset loaded successfully")
    logger.debug(f"Dataset shape: {heart_data.shape}")
    logger.debug(f"Dataset columns: {list(heart_data.columns)}")
    logger.debug(f"Missing values in dataset: {heart_data.isnull().sum().sum()}")
    logger.debug(f"Target value distribution: {heart_data['target'].value_counts().to_dict()}")

    return heart_data


def prepare_data(heart_data: pd.DataFrame):
    """Separate features/target and split the dataset."""
    logger.info("Preparing features and target variable")

    X = heart_data.drop(columns=["target"])
    Y = heart_data["target"]

    logger.debug(f"Feature matrix shape: {X.shape}")
    logger.debug(f"Target vector shape: {Y.shape}")

    logger.info("Splitting dataset into training and testing data")
    X_train, X_test, Y_train, Y_test = train_test_split(
        X,
        Y,
        test_size=0.2,
        stratify=Y,
        random_state=2
    )

    logger.debug(f"X_train shape: {X_train.shape}")
    logger.debug(f"X_test shape: {X_test.shape}")
    logger.debug(f"Y_train shape: {Y_train.shape}")
    logger.debug(f"Y_test shape: {Y_test.shape}")

    return X_train, X_test, Y_train, Y_test


def train_model(X_train, Y_train):
    """Train Logistic Regression model."""
    logger.info("Training Logistic Regression model")

    model = LogisticRegression(max_iter=1000)
    model.fit(X_train, Y_train)

    logger.success("Model training completed")
    return model


def evaluate_model(model, X_train, X_test, Y_train, Y_test):
    """Calculate accuracy on training and testing data."""
    logger.info("Evaluating model accuracy")

    X_train_prediction = model.predict(X_train)
    training_data_accuracy = accuracy_score(X_train_prediction, Y_train)

    X_test_prediction = model.predict(X_test)
    test_data_accuracy = accuracy_score(X_test_prediction, Y_test)

    logger.success(f"Accuracy on training data: {training_data_accuracy}")
    logger.success(f"Accuracy on test data: {test_data_accuracy}")

    return training_data_accuracy, test_data_accuracy


# -----------------------------
# PySnooper Example
# -----------------------------
@pysnooper.snoop("logs/pysnooper_output.log", normalize=True)
def predict_sample(model):
    """
    Predict heart disease for one sample input.
    PySnooper traces this function line by line.
    """
    input_data = (62, 0, 0, 140, 268, 0, 0, 160, 0, 3.6, 0, 2, 2)

    # Convert input data to numpy array
    input_data_as_numpy_array = np.asarray(input_data)

    # Reshape because prediction is being made for one person only
    input_data_reshaped = input_data_as_numpy_array.reshape(1, -1)

    prediction = model.predict(input_data_reshaped)

    if prediction[0] == 0:
        result = "The Person does not have a Heart Disease"
    else:
        result = "The Person has Heart Disease"

    return prediction, result


def main():
    """Main project execution flow."""
    logger.info("Heart Disease Prediction project started")

    heart_data = load_dataset("heart_disease_data.csv")
    X_train, X_test, Y_train, Y_test = prepare_data(heart_data)
    model = train_model(X_train, Y_train)
    training_accuracy, test_accuracy = evaluate_model(
        model,
        X_train,
        X_test,
        Y_train,
        Y_test
    )

    prediction, result = predict_sample(model)

    print("Accuracy on Training data:", training_accuracy)
    print("Accuracy on Test data:", test_accuracy)
    print("Prediction:", prediction)
    print(result)

    logger.info(f"Final prediction result: {result}")
    logger.info("Heart Disease Prediction project completed")


if __name__ == "__main__":
    main()
