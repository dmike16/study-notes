use std::rc::Rc;
use conslist::List;


fn main() {
    let a = Rc::new(List::Cons(5, Rc::new(List::Cons(10, Rc::new(List::Nil)))));
    println!("Count after creating a={}", Rc::strong_count(&a));
    let _b = List::Cons(3, Rc::clone(&a));
    println!("Conut after creating b={}", Rc::strong_count(&a));
    {
        let _c = List::Cons(4, Rc::clone(&a));
        println!("Count after creating c={}", Rc::strong_count(&a));
    }
    println!("Count after dropping c={}", Rc::strong_count(&a));

    let msg: Option<& 'static str> = Some("hello");
    if let Some(m) = msg {
        let s: &str = m;
        println!("messaage {}", s);
        println!("messaage {:?}", msg);
    }
    println!("messaage {:?}", msg);

}
