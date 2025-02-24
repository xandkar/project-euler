#[test]
fn problem_001_test() {
    assert_eq!(23, project_euler::problem_001::solution(10));
}

#[test]
fn problem_001_real() {
    assert_eq!(233168, project_euler::problem_001::solution(1000));
}

#[test]
fn problem_018_test() {
    let data_test = project_euler::problem_018::data("./018/test.dat");
    assert_eq!(23, project_euler::problem_018::solution(&data_test));
}

#[test]
fn problem_018_real() {
    let data_real = project_euler::problem_018::data("./018/problem_018.dat");
    assert_eq!(1074, project_euler::problem_018::solution(&data_real));
}
