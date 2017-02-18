#! /usr/bin/env node

"use strict"

var is_divisible_by_upto = function(n, max_divisor) {
    var is_divisible = true;
    var i = 1;
    for (i; i <= max_divisor; i++) {
      if (n % i != 0) {
        is_divisible = false;
        break
      };
    };
    return is_divisible
}

var project_euler_005 = function() {
  var smallest_divisible = null;
  var max_divisor = 20;
  var candidate = max_divisor;
  while (smallest_divisible == null) {
    if (is_divisible_by_upto(candidate, max_divisor)) {
      smallest_divisible = candidate;
      break
    } else {
      candidate += max_divisor
    }
  }
  console.log("%d", smallest_divisible)
}

project_euler_005()
