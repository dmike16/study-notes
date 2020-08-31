use std::env;
use std::process;
use minigrep::configuration;

fn main() {
    let args: Vec<String> = env::args().collect();

    let conf = configuration::Options::new(&args).unwrap_or_else(|err| {
        eprintln!("Problem parsing arguments {}", err);
        process::exit(1);
    });


    if let Err(e) = minigrep::run(conf){
        eprintln!("Application error, {}", e);
        process::exit(1);
    }
}
