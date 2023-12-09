rustc --edition=2021 --target=thumbv7m-none-eabi --crate-type=staticlib --crate-name=nopanic --emit=link --emit=obj=nopanic.o -Zcrate-attr=no_std lib.rs
echo "rustc --edition=2021 --target=thumbv7m-none-eabi --crate-type=staticlib --crate-name=nopanic --emit=link --emit=obj=nopanic.o -Zcrate-attr=no_std lib.rs"
# arm-none-eabi-objcopy nopanic.o