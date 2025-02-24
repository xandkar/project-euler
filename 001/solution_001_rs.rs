pub fn solution(upto: u64) -> u64 {
    (1..upto).filter(|i| i % 3 == 0 || i % 5 == 0).sum()
}
