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



#[unsafe(no_mangle)]
pub extern "C" fn main() {
    let expected = 13;
    let actual = fib(6);
    eval(actual, expected);
}

#[naked_function::naked]
#[no_mangle]
pub unsafe extern "C" fn _start() {
    asm!(
    "li sp, 0x100000",
    "call {main}",
    "j 0",
    main = sym main,
    );
}