#![no_std]
#![no_main]

mod flow_facts;

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {};
}

// Out-of-bounds check (Rust 1.37.0)
#[no_mangle]
fn _ZN4core9panicking18panic_bounds_check17h0537ade040df571eE() -> ! {
    loop{}
}

#[no_mangle]
#[inline(never)]
fn fib(n : u32) -> u32 {
    let mut sum: u32 = 0;
    let mut last: u32 = 0;
    let mut curr: u32 = 1;

    if n == 1 { return 1 }
    for i in 2..n {
        sum = last + curr;
        last = curr;
        curr = sum;
        unsafe {flow_facts::llvm_loopbound(2, 100);}
    }
    sum
}

#[inline(never)]
fn eval(actual : u32, expected : u32) -> bool {
    if expected - actual == 0 {
        true
    } else {
        false
    }
}

#[no_mangle]
pub extern "C" fn main() -> u32 {
    let res = fib(48);
    if !eval(res, 2971215073) {
        1
    } else {
        0
    }
}

