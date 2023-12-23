use nopanic;
use manna::peripheral::rcc;
use manna::peripheral::gpio;
use manna::peripheral::gpio::GPIO_Sect;
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
    let mut rcc_reg = rcc::get_rcc();
    let mut gpiob = gpio::get_gpio(GPIO_Sect::GPIOB);
    let mut rcc_apb2enr = rcc_reg.APB2ENR.read();

    rcc_apb2enr |= (0x01 << 3) | (0x01 << 4);

    rcc_reg.APB2ENR.write(rcc_apb2enr);

    loop 
    {
        gpiob.ODR.write(0x10000000);
    }
}