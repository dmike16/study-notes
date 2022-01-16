mod tests_module;

use crate::tests_module::sub_tests;

pub fn run_test() {
    // Absolute path
    crate::tests_module::it_works();
    sub_tests::it_works();
}
