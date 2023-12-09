cd nopanic
./build.sh
cd ..
rustc --target=thumbv7m-none-eabi --edition=2021 --emit=obj main.rs --extern nopanic -Zcrate-attr=no_std -Zcrate-attr=no_main -o main.o -Lnopanic/