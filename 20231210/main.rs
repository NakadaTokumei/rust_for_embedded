use nopanic;

#[no_mangle]
pub extern "C" fn TIM6_Handler()
{
    let mut a : u32 = 0;
    a += 1;
}

#[no_mangle]
pub extern "C" fn main() -> !
{
    let mut _a : u32 = 0;
    loop 
    {
        _a+=1;
    }
}