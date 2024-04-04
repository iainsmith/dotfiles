#! /usr/bin/env python3

import sys
import re

# custom sorting order defined here:
order = {"A ": 1, "MM": 3, " M": 4, "??": 6, "D": 2, " D": 5, "##": 7}

ansi_re = re.compile(r"\x1b[^m]*m")


def main():
    print(
        "".join(
            sorted(
                sys.stdin.readlines(),
                key=lambda line: order.get(ansi_re.sub("", line)[0:2], 0),
            )
        )
    )


if __name__ == "__main__":
    main()
