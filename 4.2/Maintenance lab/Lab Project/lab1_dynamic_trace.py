import os
import sys
import warnings
from collections import Counter

import lab3_heart_disease_tools as project


OUTPUT_DIR = "outputs"
TRACE_FILE = os.path.join(OUTPUT_DIR, "lab1_dynamic_trace.log")
SUMMARY_FILE = os.path.join(OUTPUT_DIR, "lab1_dynamic_summary.txt")

os.makedirs(OUTPUT_DIR, exist_ok=True)

TARGET_FILE = os.path.abspath("lab3_heart_disease_tools.py")
event_counter = Counter()
function_counter = Counter()
executed_lines = set()


def short_value(value, max_length=80):
    """Make variable values shorter so the trace file stays readable."""
    text = repr(value)
    if len(text) > max_length:
        text = text[:max_length] + "..."
    return text


def tracer(frame, event, arg):
    current_file = os.path.abspath(frame.f_code.co_filename)

    # Only trace our project file, not sklearn/pandas/numpy internal files
    if current_file != TARGET_FILE:
        return tracer

    function_name = frame.f_code.co_name
    line_number = frame.f_lineno

    event_counter[event] += 1
    function_counter[function_name] += 1

    if event == "line":
        executed_lines.add(line_number)

    local_vars = {
        name: short_value(value)
        for name, value in frame.f_locals.items()
        if not name.startswith("__")
    }

    with open(TRACE_FILE, "a", encoding="utf-8") as file:
        file.write(
            f"Event: {event:<9} | "
            f"Function: {function_name:<25} | "
            f"Line: {line_number:<4} | "
            f"Locals: {local_vars}\n"
        )

    return tracer


def main():
    warnings.filterwarnings(
        "ignore",
        message="X does not have valid feature names.*"
    )

    # Clear old trace file
    with open(TRACE_FILE, "w", encoding="utf-8") as file:
        file.write("Lab 1 Dynamic Trace Output\n")
        file.write("==========================\n\n")

    print("Starting dynamic analysis using sys.settrace()...")

    sys.settrace(tracer)
    try:
        project.main()
    finally:
        sys.settrace(None)

    with open(SUMMARY_FILE, "w", encoding="utf-8") as file:
        file.write("Lab 1 Dynamic Analysis Summary\n")
        file.write("==============================\n\n")
        file.write(f"Target file: {TARGET_FILE}\n")
        file.write(f"Total traced events: {sum(event_counter.values())}\n")
        file.write(f"Executed unique lines: {len(executed_lines)}\n\n")

        file.write("Event counts:\n")
        for event, count in event_counter.items():
            file.write(f"{event}: {count}\n")

        file.write("\nFunction execution counts:\n")
        for function, count in function_counter.most_common():
            file.write(f"{function}: {count}\n")

        file.write("\nExecuted line numbers:\n")
        file.write(", ".join(str(line) for line in sorted(executed_lines)))

    print("Dynamic analysis completed successfully.")
    print(f"Trace saved to: {TRACE_FILE}")
    print(f"Summary saved to: {SUMMARY_FILE}")


if __name__ == "__main__":
    main()