use std::path::Path;

use cairo_vm::{
    cairo_run::CairoRunConfig,
    felt::Felt252,
    hint_processor::builtin_hint_processor::builtin_hint_processor_definition::BuiltinHintProcessor,
    types::{program::Program, relocatable::MaybeRelocatable},
    vm::{
        runners::{builtin_runner::BuiltinRunner, cairo_runner::CairoRunner},
        vm_core::VirtualMachine,
    },
};

fn main() {
    // Init CairoRunConfig
    let cairo_run_config = CairoRunConfig {
        layout: "plain",
        relocate_mem: true,
        trace_enabled: true,
        proof_mode: true,
        ..Default::default()
    };

    // Load the Program
    let program = Program::from_file(Path::new("resources/fibonacci_compiled.json"), None).unwrap();
    let mut cairo_runner = CairoRunner::new(&program, "small", true).unwrap();

    // Init the Cairo VM
    let mut vm = VirtualMachine::new(cairo_run_config.trace_enabled);
    let end = cairo_runner.initialize(&mut vm).unwrap();

    let mut hint_processor = BuiltinHintProcessor::new_empty();

    cairo_runner
        .run_until_pc(end, &mut vm, &mut hint_processor)
        .unwrap();
    cairo_runner
        .end_run(
            cairo_run_config.disable_trace_padding,
            false,
            &mut vm,
            &mut hint_processor,
        )
        .unwrap();
    if cairo_run_config.proof_mode {
        cairo_runner.finalize_segments(&mut vm).unwrap();
    }

    let output_base = vm
        .get_builtin_runners()
        .iter()
        .find(|&elt| matches!(elt, BuiltinRunner::Output(_)))
        .expect("Os vm should have the output builtin")
        .base();
    let raw_output = vm.get_range((output_base as isize, 0).into(), 2);
    let raw_output: Vec<Felt252> = raw_output
        .iter()
        .map(|x| {
            if let MaybeRelocatable::Int(val) = x.clone().unwrap().into_owned() {
                val
            } else {
                panic!("Output should be all integers")
            }
        })
        .collect();

    println!("{:?}", raw_output);
}

pub fn felt_vm2usize(felt_op: Option<&Felt252>) -> usize {
    match felt_op {
        Some(felt) => {
            let big_num: u16 = felt.to_bigint().try_into().unwrap();

            big_num.into()
        }
        None => panic!("no length available"),
    }
}
