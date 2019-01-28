FROM ubuntu
ARG BASENAME=mcuxpressoide-10.3.0_2200
ARG DEB_FILE=${BASENAME}.x86_64.deb
ARG BIN_FILE=${DEB_FILE}.bin
RUN apt-get update && apt-get install -y wget make \
  && cd /root \
  && wget -q https://freescaleesd.flexnetoperations.com/337170/797/13845797/mcuxpressoide-10.3.0_2200.x86_64.deb.bin \
  && chmod +x /root/${BIN_FILE} \
  && ./${BIN_FILE} --noexec --target mcuxpresso \
  && dpkg --unpack mcuxpresso/${DEB_FILE} \
  && rm /var/lib/dpkg/info/mcuxpressoide.postinst -f \
  && dpkg --configure --force-depends mcuxpressoide \
  && rm -rf /root/* \
  && ln -s /usr/local/${BASENAME}/ide/mcuxpressoide /bin/mcuxpressoide
