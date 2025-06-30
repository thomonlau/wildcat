#![no_std]
#![no_main]

use core::panic::PanicInfo;
use core::arch::asm;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {};
}

#[inline(never)]
#[unsafe(no_mangle)]
fn fib(n : u32) -> u32 {
    let mut sum: u32 = 0;
    let mut last: u32 = 0;
    let mut curr: u32 = 1;
    for _i in 1..n {
        sum = last + curr;
        last = curr;
        curr = sum;
    }
    sum
}

fn unsuccessful_exit() {
    unsafe {asm!("li a0, 1")}
    unsafe {asm!("ecall")}
}

fn successful_exit() {
    unsafe {asm!("li a0, 0")}
    unsafe {asm!("ecall")}
}

#[unsafe(no_mangle)]
pub extern "C" fn _start() {
    let expected_fib : u32 = 21;
    let actual_fib : u32 = fib(6);
    if expected_fib == actual_fib {
        successful_exit();
    } else {
        unsuccessful_exit();
    }
}