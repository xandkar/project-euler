# 2012-05-29


def is_palindrome(n):
    return str(n) == str(n)[::-1]


def project_euler_004(first, last):
    given_range = xrange(first, last + 1)
    products = [x * y for x in given_range for y in given_range]
    palindromes = [n for n in products if is_palindrome(n)]
    solution = sorted(palindromes)[-1]
    print solution


if __name__ == '__main__':
    project_euler_004(100, 999)
