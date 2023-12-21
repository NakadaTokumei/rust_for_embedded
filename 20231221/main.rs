use nopanic;
use manna::peripheral::core::nvic;

#[no_mangle]
pub extern "C" fn TIM6_Handler()
{
    let mut a : u32 = 0;
    a += 1;
}

#[no_mangle]
pub extern "C" fn main() -> !
{
    let mut _nvic = nvic::get_nvic();
    loop 
    {
        _nvic.ISER[0].write(1);
    }
}