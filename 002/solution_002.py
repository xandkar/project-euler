#! /usr/bin/env python


def fibonacci(ceiling):
    a = 0
    b = 1
    fib = a + b

    while fib < ceiling:
        yield fib
        a = b
        b = fib
        fib = a + b


def project_euler_002(n):
    fibs = fibonacci(4000000)
    fibs_even = filter(lambda n: not n % 2, fibs)
    solution = sum(fibs_even)

    print solution


if __name__ == '__main__':
    project_euler_002(4000000)
