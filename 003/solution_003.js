#! /usr/bin/env node

"use strict"

var is_prime = function(n) {
    var is_prime = true;
    if (n != 2 && (n < 2 || n % 2 === 0)) {
        is_prime = false
    } else {
        var max_divisor = Math.round(Math.sqrt(n));
        var i = 3;
        for (i; i < max_divisor; i += 2) {
            if (n % i === 0) {
                is_prime = false;
                break
            }
        }
    }
    return is_prime
}

var project_euler_003 = function(n) {
    var largest_prime_factor = null;
    var candidate = Math.round(Math.sqrt(n / 2));
    candidate = (candidate % 2 === 0) ? + 1 : candidate;
    for (candidate; candidate > 1; candidate -= 2) {
        if (is_prime(candidate) && (n % candidate === 0)) {
            largest_prime_factor = candidate;
            break
        }
    }
    console.log("%d", largest_prime_factor)
}

project_euler_003(600851475143)
