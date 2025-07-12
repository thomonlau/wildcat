#![no_std]
#![no_main]

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

#[inline(never)]
fn fib(n : u32) -> u32 {
    let mut sum: u32 = 0;
    let mut last: u32 = 0;
    let mut curr: u32 = 1;

    if n <= 0 { panic!() }
    if n == 1 { return 1 }
    for i in 2..48 {
        if i > n {
            break;
        }
        sum = last + curr;
        last = curr;
        curr = sum;
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
    if !eval(fib(48), 2971215073) {
        1
    } else {
        0
    }
}
