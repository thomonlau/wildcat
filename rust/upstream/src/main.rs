#![no_std]
#![no_main]

use core::panic::PanicInfo;

const UART_ADDR: *mut u32 = 0xf000_0004 as *mut u32;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {};
}

#[inline(never)]
#[unsafe(no_mangle)]
fn main() {
    let mut sum: u32 = 0;
    let mut last: u32 = 0;
    let mut curr: u32 = 1;
    for _i in 1..6 {
        sum = last + curr;
        last = curr;
        curr = sum;
    }
    unsafe {
        UART_ADDR.write_volatile(sum + 48);
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn _start() -> ! {
    main();
    loop {}
}