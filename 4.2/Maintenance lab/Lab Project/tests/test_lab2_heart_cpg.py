import numpy as np
import pandas as pd
from sklearn.linear_model import LogisticRegression

from lab3_heart_disease_tools import (
    prediction_to_message,
    check_accuracy_status,
    validate_sample_input,
    load_dataset,
    prepare_data,
    train_model,
    evaluate_model,
    predict_sample,
)


def test_no_heart_disease_prediction():
    assert prediction_to_message([0]) == "The Person does not have a Heart Disease"


def test_good_model_accuracy():
    assert check_accuracy_status(0.8553719008264463, 0.8032786885245902) == "good-model"


def test_valid_sample_input():
    sample = (62, 0, 0, 140, 268, 0, 0, 160, 0, 3.6, 0, 2, 2)
    assert validate_sample_input(sample) == "valid-input"


def test_heart_disease_prediction():
    assert prediction_to_message([1]) == "The Person has Heart Disease"


def test_numpy_prediction_input():
    assert prediction_to_message(np.array([0])) == "The Person does not have a Heart Disease"


def test_direct_prediction_input():
    assert prediction_to_message(1) == "The Person has Heart Disease"


def test_invalid_prediction_value():
    assert prediction_to_message([2]) == "Invalid prediction value"


def test_invalid_accuracy_value():
    assert check_accuracy_status(-0.5, 0.80) == "invalid-accuracy"


def test_accuracy_greater_than_one():
    assert check_accuracy_status(1.20, 0.80) == "invalid-accuracy"


def test_possible_overfitting_model():
    assert check_accuracy_status(0.95, 0.70) == "possible-overfitting"


def test_model_needs_improvement():
    assert check_accuracy_status(0.70, 0.68) == "needs-improvement"


def test_missing_sample_input():
    assert validate_sample_input(None) == "missing-input"


def test_invalid_sample_input_length():
    sample = (62, 0, 0)
    assert validate_sample_input(sample) == "invalid-input-length"


def test_non_numeric_sample_input():
    sample = (62, 0, 0, 140, 268, 0, 0, 160, 0, 3.6, 0, 2, "high")
    assert validate_sample_input(sample) == "non-numeric-input"


def test_load_dataset():
    data = load_dataset("heart_disease_data.csv")
    assert data.shape[0] > 0
    assert "target" in data.columns


def test_prepare_data():
    data = load_dataset("heart_disease_data.csv")
    X_train, X_test, Y_train, Y_test = prepare_data(data)

    assert len(X_train) > 0
    assert len(X_test) > 0
    assert len(Y_train) > 0
    assert len(Y_test) > 0


def test_train_and_evaluate_model():
    data = load_dataset("heart_disease_data.csv")
    X_train, X_test, Y_train, Y_test = prepare_data(data)

    model = train_model(X_train, Y_train)
    training_accuracy, test_accuracy = evaluate_model(
        model,
        X_train,
        X_test,
        Y_train,
        Y_test
    )

    assert isinstance(model, LogisticRegression)
    assert 0 <= training_accuracy <= 1
    assert 0 <= test_accuracy <= 1


def test_predict_sample():
    data = load_dataset("heart_disease_data.csv")
    X_train, X_test, Y_train, Y_test = prepare_data(data)

    model = train_model(X_train, Y_train)
    prediction, result = predict_sample(model)

    assert prediction[0] in [0, 1]
    assert result in [
        "The Person does not have a Heart Disease",
        "The Person has Heart Disease"
    ]