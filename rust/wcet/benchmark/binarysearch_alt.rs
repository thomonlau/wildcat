#![no_std]
#![no_main]

mod flow_facts;

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

#[derive(Copy, Clone, Default)]
struct Data {
    key: i32,
    value: i32,
}

#[inline(never)]
#[no_mangle]
fn random_integer(seed : &mut i32) -> i32 {
    *seed = rem(mul(*seed, 133) + 81, 8095);
    *seed
}

#[inline(never)]
fn init(seed: &mut i32, data: &mut [Data]) {
    for i in 0..15 {
        data[i].key = i as i32;
        data[i].value = random_integer(seed);
        unsafe{flow_facts::llvm_loopbound(15, 15)};
    }
}

#[inline(never)]
fn binary_search(x : i32, data: &[Data]) -> i32 {
    let mut low : usize = 0;
    let mut up : usize = 14;
    let mut fvalue : i32 = -1;
    let mut mid : usize;

    while low <= up {
        mid = (low + up) >> 1;
        if data[mid].key == x {
            // Item found
            up = low - 1;
            fvalue = data[mid].value;
        } else if data[mid].key > x {
            // Item not found
            up = mid - 1;
        } else {
            low = mid + 1;
        }
        unsafe{flow_facts::llvm_loopbound(1, 4)};
    }

    fvalue
}

#[inline(never)]
#[no_mangle]
pub extern "C" fn main() -> u32 {
    let mut seed: i32 = 0;
    let mut data: [Data; 15] = [Data { key: 0, value: 0 }; 15];
    init(&mut seed, &mut data);
    let result = binary_search(8, &mut data);
    if result != -1 { 0 } else { 1 }
}

fn mul(x: i32, y: i32) -> i32 {
    let mut z : i32 = 0;
    for _i in 0..y {
        z += x;
    }
    z
}

fn rem(x: i32, y: i32) -> i32 {
    let mut z : i32 = x;
    while z > y {
        z -= y;
    }
    z
}
