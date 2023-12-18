use nopanic;

#[no_mangle]
pub unsafe extern "C" fn Reset_Handler()
{
    main();
}

#[no_mangle]
pub unsafe extern "C" fn main() -> !
{
    loop {}
}