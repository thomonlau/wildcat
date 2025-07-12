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
fn init(seed: &mut i32, prime_x: &mut i32, prime_y: &mut i32) {
    *prime_x = random_integer(seed);
    *prime_y = random_integer(seed);
}

#[inline(never)]
fn prime_divides(n: i32, m: i32) -> bool {
    m % n == 0
}

#[inline(never)]
fn prime_even(n: i32) -> bool {
    prime_divides(2, n)
}

#[inline(never)]
fn prime_prime(n: i32) -> bool {
    if prime_even(n) {
        return n == 2;
    }
    let mut i = 3;
    while i * i <= n {
        if prime_divides(i, n) {
            return false;
        }
    }
}


#[no_mangle]
pub extern "C" fn main() -> u32 {
    let mut seed : i32 = 0;
    let mut prime_x : i32 = 0;
    let mut prime_y : i32 = 0;

    init(&mut seed, &mut prime_x, &mut prime_y);
    let result = binary_search(8, &data);
    if result != -1 { 0 } else { 1 }
}