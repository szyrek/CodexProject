import os
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..")))

from example_project import calculator


def test_add():
    assert calculator.add(2, 3) == 5


def test_multiply():
    assert calculator.multiply(3, 4) == 12
