fn solution(upto: u64) -> u64 {
    (1..upto).filter(|i| i % 3 == 0 || i % 5 == 0).sum()
}

#[test]
fn test() {
    assert_eq!(23, solution(10));
}

fn main() {
     println!("{}", solution(1000));
}
