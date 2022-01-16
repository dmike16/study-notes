pub struct Options {
    pub filename: String,
    pub query: String
}

impl Options {
    pub fn new(mut args: std::env::Args) -> Result<Options, &'static str> {
        args.next();


        let query = if let  Some(val) = args.next() {
            val
        } else{
            return Err("Didn't get a query string");
        };

        let filename = if let Some(val) = args.next() {
            val
        } else {
            return Err("Didn't specify a filename");
        };

        Ok(Options {query, filename})
    }

}

