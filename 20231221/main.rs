use nopanic;
use manna::peripheral::rcc;
use manna::peripheral::gpio;
use manna::peripheral::gpio::GPIO_Sect;
use manna::peripheral::core::nvic;
use manna::peripheral::core::systick;

static mut a : u32 = 0;
static mut _flag : bool = false;

#[no_mangle]
pub extern "C" fn SysTick_Handler()
{
    unsafe
    {
        a += 1;
        if a >= 100
        {
            a = 0;
            _flag = !_flag;
        }
    }
}

fn systick_init()
{
    let mut nvic_reg = nvic::get_nvic();
    nvic_reg.ISER[0].write((0x01 << 6));

    let mut systick_reg = systick::get_systick();
    let mut ctrlVal : u32 = 0;
    let mut reload : u32 = 8000;

    ctrlVal = ((0x01 << 2) | (0x01 << 1) | (0x01));

    systick_reg.CTRL.write(ctrlVal);
    systick_reg.LOAD.write(reload);
}

#[no_mangle]
pub extern "C" fn main() -> !
{
    let mut rcc_reg = rcc::get_rcc();
    let mut gpioa = gpio::get_gpio(GPIO_Sect::GPIOA);

    let mut rcc_apb2enr = rcc_reg.APB2ENR.read();
    let mut gpioa_crl = gpioa.CRL.read();

    let mut gpioa_odr_val : u32 = 0;

    systick_init();

    rcc_apb2enr |= (0x01 << 2); // GPIOA on

    rcc_reg.APB2ENR.write(rcc_apb2enr);

    gpioa_crl &= !(0xff << 20);
    gpioa_crl |= (0x03 << 20);

    gpioa.CRL.write(gpioa_crl);

    loop 
    {
        unsafe
        {
            if _flag == true
            {
                gpioa_odr_val |= (0x01 << 5);
            }
            else
            {
                gpioa_odr_val &= !(0x01 << 5);
            }
        }
        gpioa.ODR.write(gpioa_odr_val);
    }
}