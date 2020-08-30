pub fn add_two(a: i32) -> i32 {
    a + 2
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
    #[test]
    #[should_panic(expected ="Make a test to fail")]
    fn it_fails() {
        panic!("Make a test to fail");
    }

    #[test]
    fn it_add_two() {
        assert_eq!(4, add_two(2));
    }
}
