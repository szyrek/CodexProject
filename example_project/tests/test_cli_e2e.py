import os
import subprocess
import sys

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..")))


def run_cli(args):
    cmd = [sys.executable, '-m', 'example_project.cli'] + args
    completed = subprocess.run(cmd, text=True, capture_output=True, check=True)
    return completed.stdout.strip()


def test_add_e2e():
    output = run_cli(['add', '2', '2'])
    assert output == '4.0'


def test_multiply_e2e():
    output = run_cli(['multiply', '3', '3'])
    assert output == '9.0'
