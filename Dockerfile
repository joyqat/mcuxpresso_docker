FROM ubuntu
ARG BASENAME=mcuxpressoide-10.3.0_2200
ARG DEB_FILE=${BASENAME}.x86_64.deb
ARG BIN_FILE=${DEB_FILE}.bin
RUN apt-get update && apt-get install wget \
  && cd /root \n\
  && wget https://freescaleesd.flexnetoperations.com/337170/797/13845797/mcuxpressoide-10.3.0_2200.x86_64.deb.bin \n\
  && chmod +x /root/${BIN_FILE} \n\
  && ./${BIN_FILE} --noexec --target mcuxpresso \n\
  && dpkg --unpack ${DEB_FILE} \n\
  && rm /var/lib/dpkg/info/mcuxpressoide.postinst -f \n\
  && dpkg --configure --force-depends mcuxpressoide \n\
  && rm -rf /root/* \n\
  && ln -s /usr/local/${BASENAME}/ide/mcuxpressoide /bin/mcuxpressoide
