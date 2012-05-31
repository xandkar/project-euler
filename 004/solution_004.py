# 2012-05-29


def is_palindrome(n):
    n = str(n)
    return n == n[::-1]


def project_euler_004(first, last):
    given_range = xrange(first, last + 1)
    products = list(set([a * b for a in given_range for b in given_range]))
    palindromes = [n for n in products if is_palindrome(n)]
    solution = max(palindromes)
    print solution


if __name__ == '__main__':
    project_euler_004(100, 999)
