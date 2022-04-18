#!/usr/bin/env python3
import os
import sys

__version__ = (0, 0, 0)


def main(*args) -> int:
    return os.EX_OK


if __name__ == "__main__":
    sys.exit(main(sys.argv))
