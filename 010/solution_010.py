import math


def is_prime(n):
    divisible = False

    if not n % 2:
        divisible = True
    else:
        for divisor in xrange(3, int(round(math.sqrt(n))) + 1, 2):
            if not n % divisor:
                divisible = True
                break

    if not divisible:
        return True
    else:
        return False


if __name__ == '__main__':
    ceiling = 2000000
    primes = [2] + [n for n in xrange(3, ceiling + 1, 2) if is_prime(n)]
    print sum(primes)
