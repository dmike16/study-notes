use std::fs::File;
use std::error::Error;

fn main() -> Result<(), Box<dyn Error>>{
    let _file = File::open("notexistrig.txt")?;
    Ok(())
    /*let _file = match file {
      Ok(f) => f,
      Err(error) => match error.kind() {
          ErrorKind::NotFound => {
              panic!("File not found {:?}", error);
          },
          other_error => {
            panic!("General error {:?}", other_error);
          }
      }
    };*/
}
