FROM nvidia/cuda:11.1.1-devel-ubuntu20.04  

LABEL maintainer="Yuki Takeda <yuki@imaginaryshort.com>"

ENV USER_NAME=tux \
    UID=1001 \
    GID=101

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y -q --no-install-recommends \
    curl sudo gosu\
    build-essential libssl-dev libffi-dev \
    python3-dev python3-pip && \
    apt-get clean

RUN pip3 install \
    numpy scipy matplotlib ipython scikit-learn pandas pillow jupyterlab


# Create user
RUN groupadd -g $GID $USER_NAME
RUN useradd -d /home/$USER_NAME -m -s /bin/bash -u $UID -g $GID $USER_NAME
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER_NAME}

WORKDIR /home/$USER_NAME

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

