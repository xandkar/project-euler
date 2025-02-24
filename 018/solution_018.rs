use std::{cmp::max, fs, path::Path};

type Data = Vec<Vec<u32>>;

fn data<P: AsRef<Path>>(path: P) -> Data {
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

fn solution(data: &Data) -> u32 {
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

fn main() {
    let data = data("./problem_018.dat");
    println!("{}", solution(&data));
}

#[test]
fn test() {
    let data_test = data("./test.dat");
    let data_real = data("./problem_018.dat");
    assert_eq!(23, solution(&data_test));
    assert_eq!(1074, solution(&data_real));
}
