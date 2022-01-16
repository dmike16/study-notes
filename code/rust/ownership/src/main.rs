fn main() {
    let s1 = String::from("Hello world");
    let s2 = s1;
    // s1 is not more valid

    println!("{}, bye", s2);
    let s3 = s2.clone();
    println!(" {} ----- {}", s2, s3);
    take_ownership(s2);
    let i = 0;
    make_copy(i);

    let s2 = give_ownership(s3);
    let il = calculate_len(&s2);
    println!(" {} ----- {}", s2, il);
}

fn take_ownership(some_string: String) {
    // some string come into scope
    println!("some string {}", some_string);
} // some_string come out of scope and drop is called

fn make_copy(some_integer: i32) {
    // some_integer come into scope
    println!("some_integer {}", some_integer);
} // some_integer come out of scope notinh happen

fn give_ownership(some_string: String) -> String {
    println!("some_string {}", some_string);

    some_string
}

// Ownership is not taken
fn calculate_len(some_string: &String) -> usize {
    some_string.len()
}
