use std::env;

fn function_placeholders() -> Vec<&'static str> {
    vec!["llvm_loopbound"]
}

fn llvm_intrinsic_for_placeholder(placeholder: &str) -> &'static str {
    match placeholder {
        "llvm_loopbound" => "llvm.loopbound",
        _ => panic!("Unknown placeholder {}", placeholder)
    }
}

fn substitute_placeholders_in_llvm_ir(file_path: &str) {
    let file_content = std::fs::read_to_string(file_path).unwrap();
    let mut updated_content = file_content;
    for placeholder in function_placeholders() {
        updated_content = updated_content.replace(
            placeholder,
            llvm_intrinsic_for_placeholder(placeholder)
        );
    }
    std::fs::write(file_path, updated_content).unwrap();
}

fn main() {
    let args: Vec<String> = env::args().collect();
    let file_path = &args[1];
    substitute_placeholders_in_llvm_ir(file_path);
}