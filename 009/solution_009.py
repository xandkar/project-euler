def find_triplets(target_sum):
    for a in xrange(target_sum):
        for b in xrange(target_sum):
            for c in xrange(target_sum):
                if (a < b < c) \
                and (a * a + b * b == c * c) \
                and (a + b + c == target_sum):
                    return (a, b, c)


def solution(target):
    triplets = find_triplets(target)
    product = triplets[0] * triplets[1] * triplets[2]
    return product


if __name__ == '__main__':
    print solution(1000)
