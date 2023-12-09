rustc --edition=2021 --target=thumbv7m-none-eabi --crate-type=rlib --emit=obj=nopanic.o -Zcrate-attr=no_std lib.rs
