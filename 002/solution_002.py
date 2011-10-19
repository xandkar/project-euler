def fibonacci(ceiling):
    a = 0
    b = 1
    fib = a + b

    while fib < ceiling:
        yield fib
        a = b
        b = fib
        fib = a + b

print sum(f for f in fibonacci(4000000) if not f % 2)
