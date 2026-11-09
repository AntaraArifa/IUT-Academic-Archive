import ast
import csv
import os
from collections import Counter


SOURCE_FILE = "lab3_heart_disease_tools.py"
OUTPUT_DIR = "outputs"

os.makedirs(OUTPUT_DIR, exist_ok=True)


class FunctionMetricVisitor(ast.NodeVisitor):
    def __init__(self):
        self.functions = []

    def visit_FunctionDef(self, node):
        counter = Counter()

        for child in ast.walk(node):
            counter[type(child).__name__] += 1

        # Approximate cyclomatic complexity:
        # starts at 1, then increases for decision points
        complexity = 1
        complexity += counter["If"]
        complexity += counter["For"]
        complexity += counter["While"]
        complexity += counter["Try"]
        complexity += counter["ExceptHandler"]
        complexity += counter["BoolOp"]

        self.functions.append({
            "function_name": node.name,
            "line_number": node.lineno,
            "arguments": len(node.args.args),
            "if_count": counter["If"],
            "for_count": counter["For"],
            "while_count": counter["While"],
            "return_count": counter["Return"],
            "call_count": counter["Call"],
            "assignment_count": counter["Assign"] + counter["AnnAssign"],
            "approx_cyclomatic_complexity": complexity,
            "total_ast_nodes": sum(counter.values())
        })

        self.generic_visit(node)


def main():
    with open(SOURCE_FILE, "r", encoding="utf-8") as file:
        source_code = file.read()

    tree = ast.parse(source_code)

    # Save full AST dump
    ast_dump_path = os.path.join(OUTPUT_DIR, "lab1_ast_dump.txt")
    with open(ast_dump_path, "w", encoding="utf-8") as file:
        file.write(ast.dump(tree, indent=4))

    # General node count
    all_nodes = [type(node).__name__ for node in ast.walk(tree)]
    node_counter = Counter(all_nodes)

    # Function-level metrics
    visitor = FunctionMetricVisitor()
    visitor.visit(tree)

    metrics_path = os.path.join(OUTPUT_DIR, "lab1_static_metrics.csv")
    with open(metrics_path, "w", newline="", encoding="utf-8") as file:
        fieldnames = [
            "function_name",
            "line_number",
            "arguments",
            "if_count",
            "for_count",
            "while_count",
            "return_count",
            "call_count",
            "assignment_count",
            "approx_cyclomatic_complexity",
            "total_ast_nodes"
        ]
        writer = csv.DictWriter(file, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(visitor.functions)

    # Summary file
    summary_path = os.path.join(OUTPUT_DIR, "lab1_static_summary.txt")
    with open(summary_path, "w", encoding="utf-8") as file:
        file.write("Lab 1 Static Analysis Summary\n")
        file.write("=============================\n\n")
        file.write(f"Analyzed source file: {SOURCE_FILE}\n")
        file.write(f"Total AST nodes: {len(all_nodes)}\n")
        file.write(f"Total functions: {len(visitor.functions)}\n\n")

        file.write("Important AST node counts:\n")
        for node_type, count in node_counter.most_common(20):
            file.write(f"{node_type}: {count}\n")

        file.write("\nFunction-level metrics:\n")
        for item in visitor.functions:
            file.write(
                f"{item['function_name']} | "
                f"Line: {item['line_number']} | "
                f"If: {item['if_count']} | "
                f"For: {item['for_count']} | "
                f"Return: {item['return_count']} | "
                f"Calls: {item['call_count']} | "
                f"Complexity: {item['approx_cyclomatic_complexity']}\n"
            )

    print("Static analysis completed successfully.")
    print(f"AST dump saved to: {ast_dump_path}")
    print(f"Metrics saved to: {metrics_path}")
    print(f"Summary saved to: {summary_path}")


if __name__ == "__main__":
    main()