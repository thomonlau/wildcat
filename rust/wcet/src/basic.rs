#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {};
}

#[inline(never)]
#[no_mangle]
fn f(out: &mut u32, x : u32) {
    for _i in 0..1024 {
        *out += x;
    }
}

#[no_mangle]
pub extern "C" fn main() -> u32 {
    let mut out = 0;
    f(&mut out, 3);
    f(&mut out, 5);
    0
}