#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {};
}

#[derive(Copy, Clone, Default)]
struct Data {
    key: i32,
    value: i32,
}

#[inline(never)]
fn random_integer(seed : &mut i32) -> i32 {
    *seed = (*seed * 133 + 81) % 8095;
    *seed
}

#[inline(never)]
fn init(seed: &mut i32, data: &mut [Data]) {
    for i in 0..15 {
        data[i].key = random_integer(seed);
        data[i].value = random_integer(seed);
    }
}

#[inline(never)]
fn binary_search(x : i32, data: &[Data]) -> i32 {
    let mut low : usize = 0;
    let mut up : usize = 14;
    let mut fvalue : i32 = -1;
    let mut mid : usize;

    for _ in 0..data.len() {
        mid = (low + up) >> 1;
        if data[mid].key == x {
            // Item found
            up = low - 1;
            fvalue = data[mid].value;
            break;
        } else {
            // Item not found
            if low == up {
                break;
            }
            else if data[mid].key > x {
                up = mid - 1;
            } else {
                low = mid + 1;
            }
        }
    }

    fvalue
}

#[no_mangle]
pub extern "C" fn main() -> u32 {
    let mut seed: i32 = 0;
    let mut data: [Data; 15] = [Data { key: 0, value: 0 }; 15];
    init(&mut seed, &mut data);
    let result = binary_search(8, &mut data);
    if result != -1 { 0 } else { 1 }
}