import math


def is_prime(candidate):
    divisible = False

    if not candidate % 2:
        divisible = True
    else:
        for divisor in xrange(3, int(round(math.sqrt(candidate))) + 1, 2):
            if not candidate % divisor:
                divisible = True
                break

    if not divisible:
        return True
    else:
        return False


def revrange(begin, end, step):
    while begin >= end:
        yield begin
        begin -= step


def get_reduced_target(target):
    candidate = int(round(math.sqrt(target)))
    if not candidate % 2:
        candidate += 1
    return candidate


def solution(target):
    reduced_target = get_reduced_target(target)

    for candidate in revrange(reduced_target, 3, 2):
        if not target % candidate:
            if is_prime(candidate):
                return candidate


if __name__ == '__main__':
    print solution(600851475143)
