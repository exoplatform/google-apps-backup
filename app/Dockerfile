FROM debian

RUN apt-get update \
    && apt-get install -y git wget build-essential locales \
    && apt-get install -y python python-dev libffi-dev libssl-dev python-pip \
    && rm -rf /var/lib/apt \
    && wget https://bootstrap.pypa.io/ez_setup.py -O - | python \
    && pip install --upgrade httplib2 streaming_httplib2 pyasn1 cffi \
    && git clone https://github.com/x8wk/Brive.git /brive \
    && cd /brive && sed -i 's/Brive==0.3.11/Brive==0.4.0/g' setup.py \
    && python setup.py install -n \
    && mkdir /config /data

COPY backend.py.patch /brive/
RUN cd /brive && patch -p0 < backend.py.patch

ENV LC_ALL en_US.UTF-8

VOLUME ["/data", "/config"]

WORKDIR /brive
