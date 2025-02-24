mod problem_001 {
    #[test]
    fn test() {
        assert_eq!(23, project_euler::problem_001::solution(10));
    }

    #[test]
    fn real() {
        assert_eq!(233168, project_euler::problem_001::solution(1000));
    }
}

mod problem_018 {
    #[test]
    fn test() {
        let data_test = project_euler::problem_018::data("018/test.dat");
        assert_eq!(23, project_euler::problem_018::solution(&data_test));
    }

    #[test]
    fn real() {
        let data_real = project_euler::problem_018::data("018/problem_018.dat");
        assert_eq!(1074, project_euler::problem_018::solution(&data_real));
    }
}

mod problem_067 {
    #[test]
    fn real() {
        let data_real = project_euler::problem_018::data("067/problem_067.dat");
        assert_eq!(7273, project_euler::problem_018::solution(&data_real));
    }
}
