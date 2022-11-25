FROM rockylinux:8
ENV LANG=en_US.UTF-8

WORKDIR /app

RUN dnf -y install epel-release \
    && dnf -y install \
        python38 \
        python38-devel \
        glibc-langpack-all \
        mariadb-connector-c-devel \
    && dnf clean all

RUN /usr/bin/python3.8 -m pip install --upgrade pip wheel setuptools

COPY webvirtbackend/requirements/production.txt /app/production.txt
COPY webvirtbackend/requirements/develop.txt /app/develop.txt

RUN set -ex && /usr/bin/python3.8 -m pip install --no-cache-dir -r develop.txt
RUN rm -rf production.txt develop.txt

VOLUME /app

EXPOSE 8000
