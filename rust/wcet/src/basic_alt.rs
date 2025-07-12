#![no_std]
#![no_main]

use core::panic::PanicInfo;

static mut OUT: u32 = 0;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {};
}

#[inline(never)]
#[no_mangle]
fn f(x: u32) {
    for _i in 0..1024 {
        unsafe {
            OUT += x;
        }
    }
}

#[no_mangle]
pub extern "C" fn main() -> u32 {
    f(3);
    f(5);
    0
}