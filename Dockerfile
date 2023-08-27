FROM php:8.1-cli
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
CMD [ "php", "./app.php" ]

ENV LIBRDKAFKA_VERSION v2.2.0
ENV BUILD_DEPS \
        build-essential \
        git \
        libsasl2-dev \
        libssl-dev \
        python-is-python3 \
        zlib1g-dev
RUN apt-get update \
    && apt-get install -y --no-install-recommends ${BUILD_DEPS} \
    && cd /tmp \
    && git clone \
        --branch ${LIBRDKAFKA_VERSION} \
        --depth 1 \
        https://github.com/edenhill/librdkafka.git \
    && cd librdkafka \
    && ./configure \
    && make \
    && make install \
    && pecl install rdkafka \
    && docker-php-ext-enable rdkafka \
    && rm -rf /tmp/librdkafka \
    && apt-get purge \
        -y --auto-remove \
        -o APT::AutoRemove::RecommendsImportant=false \
        ${BUILD_DEPS}