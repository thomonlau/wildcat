use std::env;
use wcet_util::substitute_placeholders_in_llvm_ir;

fn main() {
    let args: Vec<String> = env::args().collect();
    let file_path = &args[1];
    substitute_placeholders_in_llvm_ir(file_path);
}