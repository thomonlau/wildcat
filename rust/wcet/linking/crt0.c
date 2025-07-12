int main();
void _start(void) __attribute__((naked));
void abort(void) __attribute__((naked));

void _start(void)
{
    asm("li sp, 0x100000");
    main();
    asm("ecall");
    for(;;);
}

void abort(void)
{
    for(;;);
}

// Atomic stubs - not provided in linking, cannot be handled in RV32I
// Note: Will loop infinitely for now
void __atomic_load_1(void) {
    for(;;);
}
void __atomic_load_2(void) {
    for(;;);
}
void __atomic_load_3(void) {
    for(;;);
}
void __atomic_load_4(void) {
    for(;;);
}