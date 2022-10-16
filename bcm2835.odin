package bcm2835;

import "core:c"

foreign import bcm2835 "system:bcm2835";
@(default_calling_convention="c", link_prefix="bcm2835_")
foreign bcm2835 {

	/* Direct Driver Register Access */
	bcm2835_regbase :: proc (regbase: u8) -> ^u32 ---
	bcm2835_peri_read :: proc (paddr: ^u32) -> u32 ---
	bcm2835_peri_read_nb :: proc(paddr: ^u32) -> u32 ---
	bcm2835_peri_write :: proc(paddr: ^u32, value: u32,) ---
	bcm2835_peri_write_nb :: proc(paddr: ^u32, value: u32,) ---
	bcm2835_peri_set_bits :: proc(paddr: ^u32, value: u32, mask: u32) ---

	/* Library Init */
	init :: proc () -> c.int ---
	close :: proc () -> c.int ---
	set_debug :: proc(debug: u8) ---
	version :: proc() -> c.uint ---

	/* SPI */
	spi_begin                 :: proc() -> c.int ---
	spi_end                   :: proc() ---
	spi_setBitOrder           :: proc(order: SPIBitOrder) ---
	spi_setClockDivider       :: proc(divider: SPIClockDivider) ---
	spi_set_speed_hz          :: proc(speed_hz: u32) ---
	spi_setDataMode           :: proc(mode: SPIMode) ---
	spi_chipSelect            :: proc(cs: SPIChipSelect) ---
	spi_setChipSelectPolarity :: proc(cs: u8, active: u8) ---
	spi_transfer              :: proc(value: u8) -> u8 ---
	spi_transfernb            :: proc(tbuf: ^u8, rbuf: ^u8, len: u32) ---
	spi_transfern             :: proc(buf: ^u8, len: u32) ---
	spi_writenb               :: proc(buf: ^u8, len: u32) ---
	spi_write                 :: proc(data: u16) ---
	aux_spi_begin             :: proc() -> c.int ---
	aux_spi_end               :: proc() ---
	aux_spi_setClockDivider   :: proc (divider: u16) ---
	aux_spi_CalcClockDivider  :: proc(speed_hz: u32) -> u16 ---
	aux_spi_write             :: proc(data: u16) ---
	aux_spi_writenb           :: proc(buf: ^u8, len: u32) ---
	aux_spi_transfern         :: proc(buf: ^u8, len: u32) ---
	aux_spi_transfernb        :: proc(tranfer_buf: ^u8, recv_buf: ^u8, len: u32) ---
	aux_spi_transfer          :: proc(value: u8) -> u8 ---

	/* I2C */
	i2c_begin :: proc() -> c.int ---
	i2c_end :: proc() ---
	i2c_setSlaveAddress :: proc(addr: u8) ---
	i2c_setClockDivider :: proc(divider: u16) ---
	i2c_set_baudrate :: proc(baudrate: u32) ---
	i2c_write :: proc(buf: ^u8, len: u32) -> u8 ---
	i2c_read :: proc(buf: ^u8, len: u32) -> u8 ---
	i2c_read_register_rs :: proc(regaddr: cstring, buf: ^u8, len: u32) -> u8 ---
	i2c_write_read_rs :: proc(cmds: ^u8, cmds_len: u32, buf: ^u8, buf_len: u32) -> u8 ---

	/* Timer access */
	st_read :: proc() -> u64 --- /* Read the System Timer Counter register. */
	st_delay :: proc(offset_micros: u64, micros: u64) --- /* Delays for the specified number of microseconds with offset. */

	/* PWM */
	pwm_set_clock :: proc(divisor: u32) ---
	pwm_set_mode :: proc(channel: u8, markspace: u8, enabled: u8) ---
	pwm_set_range :: proc(channel: u8, range: u32) ---
	pwm_set_data :: proc(channel: u8, data: u32) ---

	/* SMI Bus */
	smi_begin :: proc() -> c.int ---
	smi_end :: proc() ---
	smi_set_timing :: proc(smichannel: u32, readchannel: u32, setupcycles: u32, strobecycles: u32, holdcycles: u32, pacecycles: u32) ---
	smi_write :: proc(smichannel: u32, data: u8, address: u32) ---
	smi_read :: proc(smichannel: u32, address: u32) -> u32 ---

	/* GPIO */
 	gpio_fsel :: proc(pin: u8, mode: FunctionSelect) ---
 	gpio_set :: proc(pin: u8) ---
 	gpio_clr :: proc(pin: u8) ---
 	gpio_set_multi :: proc(mask: u32) ---
 	gpio_clr_multi :: proc(mask: u32) ---
 	gpio_lev :: proc(pin: u8) -> u8 ---
 	gpio_eds :: proc(pin: u8) -> u8 ---
 	gpio_eds_multi :: proc(mask: u32) -> u32 ---
 	gpio_set_eds :: proc(pin: u8) ---
 	gpio_set_eds_multi :: proc(mask: u32) ---
 	gpio_ren :: proc(pin: u8) ---
 	gpio_clr_ren :: proc(pin: u8) ---
 	gpio_fen :: proc(pin: u8) ---
 	gpio_clr_fen :: proc(pin: u8) ---
 	gpio_hen :: proc(pin: u8) ---
 	gpio_clr_hen :: proc(pin: u8) ---
 	gpio_len :: proc(pin: u8) ---
 	gpio_clr_len :: proc(pin: u8) ---
 	gpio_aren :: proc(pin: u8) ---
 	gpio_clr_aren :: proc(pin: u8) ---
 	gpio_afen :: proc(pin: u8) ---
 	gpio_clr_afen :: proc(pin: u8) ---
 	gpio_pud :: proc(pud: u8) ---
 	gpio_pudclk :: proc(pin: u8, on: u8) ---
 	gpio_pad :: proc(group: u8) -> u32 ---
 	gpio_set_pad :: proc(group: u8, control: u32) ---
 	gpio_write :: proc(pin: u8, on: u8) ---
 	gpio_write_multi :: proc(mask: u32, on: u8) ---
 	gpio_write_mask :: proc(value: u32, mask: u32) ---
 	gpio_set_pud :: proc(pin: u8, pud: PUDControl) ---
 	gpio_get_pud :: proc(pin: u8) -> PUDControl --- 

 	delay :: proc(millis: c.uint) ---
 	delayMicroseconds :: proc(micros: u64) ---
}
