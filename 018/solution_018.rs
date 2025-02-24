use std::{cmp::max, fs, path::Path};

pub type Data = Vec<Vec<u32>>;

pub fn data<P: AsRef<Path>>(path: P) -> Data {
    fs::read_to_string(path.as_ref())
        .unwrap()
        .lines()
        .map(|line| {
            line.split_whitespace()
                .map(|n| n.parse().unwrap())
                .collect()
        })
        .collect()
}

pub fn solution(data: &Data) -> u32 {
    let mut sums = data.clone();
    let rows = sums.len();
    for r in (0..rows).rev() {
        let kols = sums[r].len();
        for k in 0..kols {
            if r > 0 && k < (kols - 1) {
                sums[r - 1][k] = sums[r - 1][k] + max(sums[r][k], sums[r][k + 1]);
            }
        }
    }
    sums[0][0]
}
