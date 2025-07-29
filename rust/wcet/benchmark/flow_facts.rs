// Mimics loopbounds of C
// Note: #[link_name = "llvm.loopbound"] nightly feature (llvm intrinsics)
extern "C" {
    pub fn llvm_loopbound(min: i32, max: i32);
}
