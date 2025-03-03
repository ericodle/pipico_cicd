# Install Zephyr SDK version 0.17.0

Install Zephyr SDK

```shell
$ wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.17.0/zephyr-sdk-0.17.0_linux-x86_64.tar.xz
$ wget -O - https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.17.0/sha256.sum | shasum --check --ignore-missing

$ tar xvf zephyr-sdk-0.17.0_linux-x86_64.tar.xz

$ cd zephyr-sdk-0.17.0
$ ./setup.sh
```
# Prepare the workspace environment

Prepare the workspace environment

```shell
$ mkdir workspace
$ pipenv shell
$ pipenv install west pip
$ west init -m https://github.com/ericodle/pipico_cicd
$ west update
$ pip install -r zephyr/scripts/requirements.txt
```

# Build application

using `UART1` for console
```
$ cd pipico_cicd
$ rm -rf build && west build -b rpi_pico2/rp2350a/m33 -- -DCONSOLE=uart1
```

# Write to flash memory

> **Note**  
> Connect the pico2 while holding down the BOOTSEL to enable flashing

```shell
$ cp build/zephyr/zephyr.uf2 pico2_device_name
```
