#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn case_sensitive() {
        let query = "duct";
        let content = "\
Rust:
safe, fast, productive.
Pick three.";

        assert_eq!(vec!["safe, fast, productive."], search(query, content));
    }

    #[test]
    #[ignore]
    fn case_insensitive() {
        let query = "rUsT";
        let content = "\
Rust:
safe, fast, productive.
Pick three.";

        assert_eq!(vec!["Rust:"], search(query, content));

    }
}

use std::error::Error;
use std::fs;

pub mod configuration;

pub fn run(conf: configuration::Options) -> Result<(), Box<dyn Error>> {
    let content = fs::read_to_string(conf.filename)?;

    for line in search(&conf.query, &content ) {
        println!("{}", line);
    }
    Ok(())
}

pub fn search<'a>(query: &str, content: &'a str) -> Vec<&'a str> {
    let mut results = Vec::new();
    
    for line in content.lines() {
        if line.contains(query) {
            results.push(line)
        }
    }

    results
}
