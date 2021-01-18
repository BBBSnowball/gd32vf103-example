# We can use the PlatformIO tools for GD32:
# ~/.platformio/packages/tool-openocd-gd32v/bin/openocd -f interface/altera-usb-blaster.cfg -c "transport select jtag" -f target/gd32vf103.cfg -c "adapter_khz 1000"
# ~/.platformio/packages/toolchain-gd32v/bin/riscv-nuclei-elf-gdb -q -x openocd.gdb


set arch riscv:rv32
directory ../gd32vf103-hal
set remotetimeout unlimited
#file ./target/riscv32imac-unknown-none-elf/debug/examples/blinky
file ./target/riscv32imac-unknown-none-elf/release/examples/blinky
#symbol-file ./target/riscv32imac-unknown-none-elf/debug/examples/blinky

target extended-remote :3333

# print demangled symbols
set print asm-demangle on

# set backtrace limit to not have infinite backtrace loops
set backtrace limit 32

load

break _start

# start the process but immediately halt the processor
stepi
