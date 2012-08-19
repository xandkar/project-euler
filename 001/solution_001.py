#!/usr/bin/env python


def project_euler_001(ceiling):
    numbers   = xrange(1, ceiling)
    multiples = filter(lambda n: not n % 3 or not n % 5, numbers)
    solution  = sum(multiples)

    print solution


if __name__ == '__main__':
    project_euler_001(1000)
