#![no_std]
#![no_main]

use core::panic::PanicInfo;

const UART_ADDR: *mut u32 = 0xf000_0004 as *mut u32;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {};
}

fn uart_write(s: &str) {
    for byte in s.bytes() {
        unsafe {
            UART_ADDR.write_volatile(byte as u32);
        }
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn _start() -> ! {
    uart_write("Hello World!");
    loop {};
}