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
fn random_integer(seed : &mut i32) -> i32 {
    *seed = (*seed * 133 + 81) % 8095;
    *seed
}

#[inline(never)]
fn init(seed: &mut i32, data: &mut [i32]) {
    for i in 0..data.len() {
        data[i] = random_integer(seed);
    }
}

#[inline(never)]
fn linear_search(x : i32, data: &[i32]) -> bool {
    let mut curr = 0;
    for _ in 0..data.len() {
        if data[curr] == x {
            return true
        }
        curr += 1;
    }
    false
}

#[no_mangle]
pub extern "C" fn main() -> u32 {
    let mut seed : i32 = 0;
    let mut data : [i32; 15] = [0; 15];
    init(&mut seed, &mut data);
    let result = linear_search(7640, &mut data);
    if result { 0 } else { 1 }
}