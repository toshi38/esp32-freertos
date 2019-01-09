FROM gcc:7.3.0

# Needed for esp32 building:
RUN apt-get update \
    && apt-get install -y gcc git wget make libncurses-dev flex bison gperf python python-pip python-setuptools \
     python-serial python-cryptography python-future python-pyparsing

RUN mkdir -p /esp \
    && cd /esp \
    && wget -nc https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz \
    && tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz \
    && rm xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz

ENV PATH="/esp/esp-idf:/esp/xtensa-esp32-elf/bin:${PATH}"
RUN echo ${PATH}

# Get ESP-IDF @ 3.1.2
RUN cd /esp \
    && git clone https://github.com/espressif/esp-idf.git \
    && cd esp-idf \
    && git checkout v3.1.2 \
    && git submodule update --init --recursive

ENV IDF_PATH="/esp/esp-idf"

RUN python -m pip install --user -r $IDF_PATH/requirements.txt
