#! /usr/bin/env node

"use strict"

var is_palindrome = function(string) {
  var is_palindrome = true;
  var n = string.length - 1;
  var middle = Math.round(n / 2);
  var i = 0;
  for (i; i <= middle; i++) {
    if (string[i] != string[n - i]) {
      is_palindrome = false;
      break
    }
  }
  return is_palindrome
}

var project_euler_004 = function() {
  var from = 100;
  var to   = 999;
  var largest_palindrome_product = null;
  var i = from;
  for (i; i <= to; i++) {
    var j = from;
    for (j; j <= to; j++) {
      var product = i * j;
      var product_str = product.toString();
      if (is_palindrome(product_str) && product > largest_palindrome_product) {
        largest_palindrome_product = product
      }
    }
  }
  console.log("%d", largest_palindrome_product)
}

project_euler_004()
