// Example of unsafe rust code
fn main() {
    println!("Hello, world!");
    deferencing_raw_pointer();
    calling_unsafe_method();
    calling_funtion_from_ext_lang();
    mutate_static_variable();
}

fn deferencing_raw_pointer() {
    let mut num = 5;
    // let address = 0x012345usize;
    // let r = address as *const i32;
    let r1 = &num as *const i32;
    let r2 = &mut num as *mut i32;
    
    unsafe {
      println!("r1 is {}", *r1);
      println!("r1 is {}", *r2);
      // println!("r1 is {}", *r);
    }
}

fn calling_unsafe_method() {
    unsafe {
        dangerous();

    }
}

unsafe fn dangerous() {
    println!("I m dangerous one");
}

extern "C" {
  fn abs(input: i32) -> i32;
}

fn calling_funtion_from_ext_lang() {
  unsafe {
    println!("Abs from C, {}", abs(-3));
  }
}

static mut COUNTER: u32 = 0;

fn mutate_static_variable() {
  unsafe {
    COUNTER += 1;
    println!("COUNTER: {}", COUNTER);
  }
}
