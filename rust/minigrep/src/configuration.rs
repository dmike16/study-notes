pub struct Options {
    pub filename: String,
    pub query: String
}

impl Options {
    pub fn new(args: &[String]) -> Result<Options, &'static str> {
        if args.len() < 3 {
            return Err("not enough arguments");
        }

        let query = args[1].clone();
        let filename = args[2].clone();

        Ok(Options {query, filename})
    }

}

