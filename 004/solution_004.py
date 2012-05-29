# 2012-05-29


def is_palindrome(n):
    return str(n) == str(n)[::-1]


def project_euler_004(first, last):
    products = [x * y for x in xrange(first, last+1) for y in xrange(first, last+1)]
    palindromes = [n for n in products if is_palindrome(n)]
    solution = sorted(palindromes)[-1]
    print solution


if __name__ == '__main__':
    project_euler_004(100, 999)
