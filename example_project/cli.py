"""Command line interface for the test project."""

from __future__ import annotations
import argparse
from . import calculator


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Simple calculator CLI")
    parser.add_argument("operation", choices=["add", "multiply"], help="Operation to perform")
    parser.add_argument("a", type=float, help="First operand")
    parser.add_argument("b", type=float, help="Second operand")
    args = parser.parse_args(argv)

    if args.operation == "add":
        result = calculator.add(args.a, args.b)
    else:
        result = calculator.multiply(args.a, args.b)

    print(result)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
