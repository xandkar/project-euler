#!/usr/bin/env python


def main():
    ''' '''

    multiples = []

    for n in xrange(1, 1000):
        for m in (3, 5):
            if not n % m:
                multiples.append(n)

    print multiples, '=', sum(multiples)


if __name__ == '__main__':
    main()
