#! /usr/bin/env python3

import sys, re

# custom sorting order defined here:
order = { 'A ' : 1, 'MM' : 2, " M": 3, '??' : 4, '##' : 5 }

ansi_re = re.compile(r'\x1b[^m]*m')

print(''.join(sorted(
    sys.stdin.readlines(),
    key=lambda line: order.get(ansi_re.sub('', line)[0:2],0))))
