use std::io::{stdin, Read};

use cairo_args_runner::{Arg, Felt252, VecFelt252};
use clap::Parser;

use cairo_proof_parser::parse;

#[derive(Parser)]
#[command(author, version, about, long_about = None)]
enum Cli {
    Parse,
    Verify {
        /// Path to compiled sierra file
        target: String,
    },
}

fn main() -> anyhow::Result<()> {
    let mut input = String::new();
    stdin().read_to_string(&mut input)?;
    let exprs = parse(input)?.to_string();

    match Cli::parse() {
        Cli::Parse => println!("{}", exprs),
        Cli::Verify { target } => println!("{:?}", run(exprs, target)?),
    }

    Ok(())
}

fn run(parsed: String, target: String) -> anyhow::Result<Vec<Felt252>> {
    let target = target;
    let function = "main";
    let args: VecFelt252 = serde_json::from_str(&parsed).unwrap();
    Ok(cairo_args_runner::run(
        &target,
        function,
        &[Arg::Array(args.to_vec())],
    )?)
}
