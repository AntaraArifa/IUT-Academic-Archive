"""
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

import sys
from pathlib import Path

import numpy as np
import pandas as pd
import pysnooper
from loguru import logger
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score


# -----------------------------
# Project Path Configuration
# -----------------------------
BASE_DIR = Path(__file__).resolve().parent

DATASET_PATH = BASE_DIR / "heart_disease_data.csv"
LOGS_DIR = BASE_DIR / "logs"
OUTPUTS_DIR = BASE_DIR / "outputs"

LOGURU_LOG_PATH = LOGS_DIR / "loguru_output.log"
PYSNOOPER_LOG_PATH = LOGS_DIR / "pysnooper_output.log"

TARGET_COLUMN = "target"

FEATURE_COLUMNS = (
    "age",
    "sex",
    "cp",
    "trestbps",
    "chol",
    "fbs",
    "restecg",
    "thalach",
    "exang",
    "oldpeak",
    "slope",
    "ca",
    "thal",
)

REQUIRED_COLUMNS = FEATURE_COLUMNS + (TARGET_COLUMN,)

DEFAULT_SAMPLE = (
    62, 0, 0, 140, 268, 0, 0,
    160, 0, 3.6, 0, 2, 2
)

# Create folders for lab outputs
LOGS_DIR.mkdir(exist_ok=True)
OUTPUTS_DIR.mkdir(exist_ok=True)


# -----------------------------
# Loguru Configuration
# -----------------------------&
logger.remove()

# Console logging
logger.add(sys.stderr, level="INFO")

# File logging
logger.add(
    str(LOGURU_LOG_PATH),
    format="{time:YYYY-MM-DD HH:mm:ss} | {level} | {message}",
    level="DEBUG",
    diagnose=False
)

def validate_dataset_schema(heart_data):
    """
    Validate the structure and basic quality of the heart disease dataset.
    """

    missing_columns = [
        column for column in REQUIRED_COLUMNS
        if column not in heart_data.columns
    ]

    if missing_columns:
        raise ValueError(
            f"Dataset validation failed. Missing required columns: {missing_columns}"
        )

    if heart_data[list(REQUIRED_COLUMNS)].isnull().any().any():
        raise ValueError(
            "Dataset validation failed. Missing values were found."
        )

    valid_target_values = {0, 1}
    actual_target_values = set(heart_data[TARGET_COLUMN].unique())

    if not actual_target_values.issubset(valid_target_values):
        raise ValueError(
            f"Dataset validation failed. Invalid target values: "
            f"{actual_target_values - valid_target_values}"
        )

    return True


def load_dataset(file_path=DATASET_PATH) -> pd.DataFrame:
    logger.info("Loading dataset")
    heart_data = pd.read_csv(file_path)

    validate_dataset_schema(heart_data)

    logger.success("Dataset loaded and validated successfully")
    logger.debug(f"Dataset shape: {heart_data.shape}")
    logger.debug(f"Dataset columns: {list(heart_data.columns)}")
    logger.debug(f"Missing values in dataset: {heart_data.isnull().sum().sum()}")
    logger.debug(
        f"Target value distribution: "
        f"{heart_data[TARGET_COLUMN].value_counts().to_dict()}"
    )

    return heart_data


def prepare_data(heart_data: pd.DataFrame):
    """Separate features/target and split the dataset."""
    logger.info("Preparing features and target variable")

    X = heart_data.drop(columns=[TARGET_COLUMN])
    Y = heart_data[TARGET_COLUMN]

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
# Lab 2 Helper Functions
# These functions are useful for CPG analysis and branch coverage testing.
# -----------------------------
def prediction_to_message(prediction):
    """
    Convert model prediction output into a readable message.
    The model prediction is usually 0 or 1.
    """

    if isinstance(prediction, (np.ndarray, list, tuple)):
        value = int(prediction[0])
    else:
        value = int(prediction)

    messages = {
        0: "The Person does not have a Heart Disease",
        1: "The Person has Heart Disease"
    }

    return messages.get(value, "Invalid prediction value")

def check_accuracy_status(training_accuracy, test_accuracy):
    """
    Check model quality using training and testing accuracy.
    """

    if training_accuracy < 0 or test_accuracy < 0 or training_accuracy > 1 or test_accuracy > 1:
        return "invalid-accuracy"

    gap = training_accuracy - test_accuracy

    if test_accuracy >= 0.80 and gap <= 0.10:
        return "good-model"

    if gap > 0.10:
        return "possible-overfitting"

    return "needs-improvement"


def validate_sample_input(input_data):
    """
    Validate whether the sample patient input is usable for prediction.
    The heart disease dataset uses 13 feature values.
    """

    if input_data is None:
        return "missing-input"

    if len(input_data) != 13:
        return "invalid-input-length"

    for value in input_data:
        if not isinstance(value, (int, float, np.integer, np.floating)):
            return "non-numeric-input"

        if not np.isfinite(value):
            return "non-finite-input"

    return "valid-input"
    """
    Validate whether the sample patient input is usable for prediction.
    The heart disease dataset uses 13 feature values.
    """

    if input_data is None:
        return "missing-input"

    if len(input_data) != 13:
        return "invalid-input-length"

    for value in input_data:
        if not isinstance(value, (int, float, np.integer, np.floating)):
            return "non-numeric-input"

def parse_sample_input(sample_text):
    """
    Convert comma-separated terminal input into patient feature values.
    """

    try:
        values = tuple(float(value.strip()) for value in sample_text.split(","))
    except ValueError:
        raise ValueError(
            "Sample input must contain numeric values separated by commas."
        )

    validation_status = validate_sample_input(values)

    if validation_status != "valid-input":
        raise ValueError(
            f"Invalid sample input: {validation_status}"
        )

    return values


# -----------------------------
# PySnooper Example
# -----------------------------
@pysnooper.snoop(str(PYSNOOPER_LOG_PATH), normalize=True)
def predict_sample(model, input_data=None):
    """
    Predict heart disease for a patient sample.
    """

    if input_data is None:
        input_data = DEFAULT_SAMPLE

    input_status = validate_sample_input(input_data)

    if input_status != "valid-input":
        return np.array([]), f"Invalid input: {input_status}", None

    input_data_as_numpy_array = np.asarray(input_data, dtype=float)
    input_data_reshaped = input_data_as_numpy_array.reshape(1, -1)

    prediction = model.predict(input_data_reshaped)
    probability = model.predict_proba(input_data_reshaped)[0][1]

    result = prediction_to_message(prediction)

    return prediction, result, probability


def main():
    """Main project execution flow."""
    logger.info("Heart Disease Prediction project started")

    heart_data = load_dataset()
    X_train, X_test, Y_train, Y_test = prepare_data(heart_data)
    model = train_model(X_train, Y_train)

    training_accuracy, test_accuracy = evaluate_model(
        model,
        X_train,
        X_test,
        Y_train,
        Y_test
    )

    model_status = check_accuracy_status(training_accuracy, test_accuracy)
    logger.info(f"Model quality status: {model_status}")

    custom_sample = None

    if len(sys.argv) > 1:
        if sys.argv[1] == "--sample" and len(sys.argv) > 2:
            custom_sample = parse_sample_input(sys.argv[2])

    prediction, result, probability = predict_sample(model, custom_sample)

    print("Accuracy on Training data:", training_accuracy)
    print("Accuracy on Test data:", test_accuracy)
    print("Prediction:", prediction)
    print(result)
    if probability is not None:
        print(f"Model probability for heart disease class: {probability:.2%}")

    if probability is not None:
        logger.info(
            f"Predicted probability for heart disease class: {probability:.4f}"
        )
    logger.info("Heart Disease Prediction project completed")


if __name__ == "__main__":
    main()