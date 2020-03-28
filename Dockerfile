FROM ubuntu
ARG BASENAME=mcuxpressoide-11.1.0_3209
ARG DEB_FILE=${BASENAME}.x86_64.deb
ARG BIN_FILE=${DEB_FILE}.bin
RUN apt-get update && apt-get install -y wget make \
  && cd /root \
  && wget -q https://freescaleesd.flexnetoperations.com/337170/827/15347827/mcuxpressoide-11.1.0_3209.x86_64.deb.bin \
  && chmod +x /root/${BIN_FILE} \
  && ./${BIN_FILE} --noexec --target mcuxpresso \
  && dpkg --unpack mcuxpresso/${DEB_FILE} \
  && rm /var/lib/dpkg/info/mcuxpressoide.postinst -f \
  && dpkg --configure --force-depends mcuxpressoide \
  && rm -rf /root/* \
  && ln -s /usr/local/${BASENAME}/ide/mcuxpressoide /bin/mcuxpressoide
