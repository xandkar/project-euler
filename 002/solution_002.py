fibonacci = [1, 2]

while fibonacci[-2] + fibonacci[-1] <= 4000000:
    fibonacci.append(fibonacci[-1] + fibonacci[-2])

print sum([f for f in fibonacci if not f % 2])
