https://gitpod.io/#https://github.com/op07n/gitpod_esp32

To check if the toolchain was properly installed use this command:

>  xtensa-esp32-elf-gcc -v


> python -m pip install --user -r $IDF_PATH/requirements.txt
> cp -r $IDF_PATH/examples/get-started/hello_world .
> cd hello_world
> make -j8 defconfig
> make -j8 all

# gitpod_esp32
