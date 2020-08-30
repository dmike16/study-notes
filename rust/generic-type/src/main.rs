fn largest<T: PartialOrd>(list: &[T]) -> &T {
    let mut largest: &T = &list[0];
    for item in list {
        if item > largest {
            largest = item;
        }
    }
    largest
}

fn longest_str<'a>(s1: &'a str, s2: &'a str) -> &'a str {
    if s1.len() > s2.len() {
        return s1;
    }
    s2
}

fn main() {
    let number_list = vec![34, 50, 25, 100, 65];
    let result = largest(&number_list);
    println!("The largest number is {}", result);
    let char_list = vec!['y', 'm', 'a', 'q'];
    let result = largest(&char_list);
    println!("The largest char is {}", result);
    println!("largest slice is {}", longest_str("pippo", "pluto"));
}
