FROM python:3.12.4

ENV IDF_PATH=/esp/ESP8266_RTOS_SDK
ENV PATH=${PATH}:/esp/xtensa-lx106-elf/bin

RUN apt-get update \
		&& apt-get install -y flex bison gperf\
		&& rm -rf /var/lib/apt/lists/*

ADD https://dl.espressif.com/dl/xtensa-lx106-elf-gcc8_4_0-esp-2020r3-linux-amd64.tar.gz /esp/
RUN tar -xzf /esp/xtensa-lx106-elf-gcc8_4_0-esp-2020r3-linux-amd64.tar.gz -C /esp && rm /esp/xtensa-lx106-elf-gcc8_4_0-esp-2020r3-linux-amd64.tar.gz

RUN git clone --depth=1 --recurse-submodules https://github.com/espressif/ESP8266_RTOS_SDK.git /esp/ESP8266_RTOS_SDK
RUN pip install --no-cache-dir -r ${IDF_PATH}/requirements.txt

CMD ["/bin/bash"]
