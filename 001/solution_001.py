#!/usr/bin/env python

print sum([n for n in xrange(1,1000) if not n % 3 or not n % 5])
