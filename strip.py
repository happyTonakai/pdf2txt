# Strip \n and - at the end of each line.

import argparse
import sys


def makeparser():
    parser = argparse.ArgumentParser()
    parser.add_argument("file")
    args = parser.parse_args()
    return args


def main(args=None):
    P = makeparser()

    with open(P.file, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    newlines = ''
    for line in lines:
        if line == '\n':
            newlines += '\n\n'
        else:
            newlines += line.strip().strip('-') + ' '

    with open(P.file, 'w', encoding='utf-8') as f:
        for line in newlines:
            f.write(line)


if __name__ == '__main__':
    sys.exit(main())
