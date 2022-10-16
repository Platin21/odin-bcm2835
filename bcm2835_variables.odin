package bcm2835;

import "core:c"

foreign import bcm2835 "system:bcm2835";
@(default_calling_convention="c", link_prefix="bcm2835_")
foreign bcm2835 {

	/* voltiles */
	/*bcm2835_peripherals_base: off_t;*/
	peripherals_size: c.size_t
	peripherals: ^u32
 
	st: ^u32
	gpio: ^u32
	pwm: ^u32 
	clk: ^u32
	pads: ^u32
	spi0: ^u32
	bsc0: ^u32
	bsc1: ^u32
	aux: ^u32
	spi1: ^u32
	smi: ^u32
}
