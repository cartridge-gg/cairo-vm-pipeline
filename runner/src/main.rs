use std::{
    io::{stdin, Read},
    str::FromStr,
};

use cairo_args_runner::{run, Arg, Felt252};
use clap::Parser;
use num_bigint::BigUint;

#[derive(Parser)]
#[command(author, version, about, long_about = None)]
struct Cli {
    /// Path to compiled sierra file
    target: String,
}

fn main() -> anyhow::Result<()> {
    let args = Cli::parse();
    let mut input = String::new();
    stdin().read_to_string(&mut input)?;
    let parsed: Vec<String> = serde_json::from_str(&input)?;

    let result = execute(parsed, args.target)?;
    println!("{result:?}");

    Ok(())
}

fn execute(parsed: Vec<String>, target: String) -> anyhow::Result<Vec<Felt252>> {
    let function = "main";

    let parsed = parsed.into_iter().map(|x| {
        if let Some(stripped) = x.strip_prefix("0x") {
            if stripped.len() % 2 == 0 {
                let n: Vec<u8> = prefix_hex::decode(format!("0x{}", stripped)).unwrap();
                Felt252::from_bytes_be(&n)
            } else {
                let n: Vec<u8> = prefix_hex::decode(format!("0x0{}", stripped)).unwrap();
                Felt252::from_bytes_be(&n)
            }
        } else {
            let n = BigUint::from_str(&x).unwrap();
            Felt252::from_bytes_be(&n.to_bytes_be())
        }
    });

    Ok(run(&target, function, &[Arg::Array(parsed.collect())])?)
}
