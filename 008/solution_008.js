#! /usr/bin/env node

"use strict"

let fs = require('fs');

let project_euler_008 = function(data_file_name) {
  let data = fs.readFileSync(data_file_name);
  data = data.toString().trim();
  let sequences = [];
  for (let i = 0; i <= (data.length - 5); i++) {
    let sequence = data.slice(i, i + 5);
    sequences.push(sequence)
  };
  let products = sequences.map(function(seq_0) {
    let seq_1 = seq_0.split("");
    let seq_2 = seq_1.map((c) => parseInt(c));
    let product = seq_2.reduce((prev, curr) => prev * curr);
    return product
  });
  let max_product = Math.max.apply(null, products);
  console.log("%d", max_product)
}

project_euler_008("problem_008.dat")
