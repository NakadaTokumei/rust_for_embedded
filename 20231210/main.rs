use nopanic;

#[no_mangle]
pub unsafe extern "C" fn Reset_Handler()
{
    main();
}

#[no_mangle]
pub extern "C" fn TIM6_Handler()
{
    let mut a : u32 = 0;
    a += 1;
}

#[no_mangle]
pub extern "C" fn main() -> !
{
    loop {}
}