#![no_std]
#![no_main]

use core::arch::asm;
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

    if n <= 0 { -1 }
    if n == 1 { 1 }
    for _i in 1..n {
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

#[unsafe(no_mangle)]
pub extern "C" fn main() {
    if !eval(fib(1), 1) { 1 };
    if !eval(fib(2), 1) { 1 };
    if !eval(fib(5), 5) { 1 };
    if !eval(fib(10), 55) { 1 };
    if !eval(fib(37), 24157817) { 1 };
    0
}