fn main() {
    println!("Hello, world! {}", four!());
    println!("Hello, world! {}", four![]);
    println!("Hello, world! {}", four! {});

    println!("{}x5 = {}", 2, times_five!(2));
    println!("value from a = {}", use_a!(a, a/10))
}

// First simple empty without matchers
#[macro_export]
macro_rules! four {
    () => {
        1 + 3
    };
}

// Macra with single metavariable in matchers
#[macro_export]
macro_rules! times_five {
    ($e:expr) => {
        $e * 5
    };
}

// example of rule that has a deeth path, because after is expanded
// a tokes cannot be backtrac
#[macro_export]
macro_rules! dead_rules {
    ($e:expr) => {};
    ($i:ident +) => {};
}

// example of a macro with local variable context
#[macro_export]
macro_rules! use_a {
    ($a:ident, $e:expr) => {
        {
            let $a = 20;
            $e
        }
    };
}
