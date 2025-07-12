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
pub extern "C" fn main() -> u32 {
    uart_write("Hello World!");
    0
}

#[naked_function::naked]
#[no_mangle]
pub unsafe extern "C" fn _start() {
    asm!(
    "li sp, 0x100000",
    "call {main}",
    "ecall"
    "j 0",
    main = sym main,
    );
}