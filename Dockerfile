FROM kalilinux/kali-linux-docker:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y \
      git \
      python \
      python-pip \
      python3 \
 && git clone https://github.com/teodem/PenTo.git \
 && cd PenTo \
 && chmod -R 777 \
      wafninja \
      joomscan \
      install-perl-module.sh \
      part-1.sh \
      part-2.sh \
      pento.sh \
 && pip install -r requirements.txt \
 && ./install-perl-module.sh \
 && apt-get remove -y \
      git \
      python-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /penTo

CMD ["./pento.sh"]
