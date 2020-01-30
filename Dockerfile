FROM gitpod/workspace-full-vnc

# Set up the environment, then download and extract the build tools.  Once extracted, remove the
# downloaded archive. After that, clone the Git repo containing the ESP-IDF (ESP IoT Development
# Framework, aka the SDK) We do this all in one operation to avoid creating extra layers in the
# resulting container.
RUN apt update && \
    apt-get install -y gcc git wget make libncurses-dev flex bison gperf python python-serial curl && \
    mkdir /opt/esp32 && \
    cd /opt/esp32 && \
#    wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
    wget https://dl.espressif.com/dl/xtensa-esp32-elf-gcc8_2_0-esp-2019r2-linux-amd64.tar.gz && \
#    tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
    tar -xzf xtensa-esp32-elf-gcc8_2_0-esp-2019r2-linux-amd64.tar.gz && \
#    rm xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
    rm xtensa-esp32-elf-gcc8_2_0-esp-2019r2-linux-amd64.tar.gz && \    
    git clone --recursive https://github.com/espressif/esp-idf.git /opt/esp32/esp-idf


#WORKDIR /opt/esp32
#
#RUN wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
#    tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
#    rm xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
#    git clone --recursive https://github.com/espressif/esp-idf.git /opt/esp32/esp-idf

# Set up paths.
# Toolchain was extracted to /opt/esp32/xtensa-esp32-elf/ directory
# and the ESP-IDF to /opt/esp-idf
ENV PATH="/opt/esp32/xtensa-esp32-elf/bin:${PATH}"
ENV IDF_PATH="/opt/esp32/esp-idf"

#  WORKDIR /usr/build
WORKDIR /home/gitpod_esp32
