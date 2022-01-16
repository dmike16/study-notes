use std::rc::Rc;

#[derive(Debug)]
pub enum List {
    Cons(i32, Rc<List>),
    Nil
}


