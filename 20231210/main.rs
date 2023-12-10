use nopanic;

#[no_mangle]
pub unsafe extern "C" fn Reset_Handler()
{
    main();
}

#[no_mangle]
pub unsafe extern "C" fn Loop_Handler()
{
    loop {}
}

#[no_mangle]
#[link_section = ".isr_vector"]
pub static RESET_VECTOR: [unsafe extern "C" fn(); 2] = 
[
    Reset_Handler,
    Loop_Handler
];

#[no_mangle]
pub unsafe extern "C" fn main() -> !
{
    loop {}
}