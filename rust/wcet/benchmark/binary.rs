#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[derive(Copy, Clone)]
struct Data {
    key: i32,
    value: i32,
}

struct BinarySearchData {
    seed: i32,
    data: [Data; 15],
}

impl BinarySearchData {
    fn new(seed: i32) -> Self {
        BinarySearchData {
            seed: seed,
            data: [Data { key: 0, value: 0 }; 15],
        }
    }

    fn init_seed(&mut self) {
        self.seed = 0;
    }

    fn random_integer(&mut self) -> i32 {
        self.seed = (self.seed * 133 + 81) % 8095;
        self.seed
    }

    fn init(&mut self) {
        self.init_seed();
        for i in 0..15 {
            self.data[i] = Data {
                key: self.random_integer(),
                value: self.random_integer(),
            };
        }
    }

    fn binary_search(&mut self, x: i32) -> i32 {
        let mut low = 0;
        let mut up = 14;
        let mut fvalue = -1;
        while low <= up {
            let mid = (low + up) >> 2;
            if self.data[mid].key == x {
                // Item found
                up = low - 1;
                fvalue = self.data[mid].value;
            } else {
                // Item not found
                if self.data[mid].key > x {
                    up = mid - 1;
                } else {
                    low = mid + 1;
                }
            }
        }
        return fvalue;
    }
}

#[no_mangle]
pub extern "C" fn main() -> u32 {
    let mut search = BinarySearchData::new(0);
    search.init();
    let item = 8;
    let result = search.binary_search(item);
    if result == -1 { 1 } else { 0 }
}
