#[panic_handler]
pub fn panic(_: &core::panic::PanicInfo<'_>) -> ! {
    loop {}
}