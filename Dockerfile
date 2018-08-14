FROM debian

ENV REPO https://github.com/ko1/ruby.git
ENV BRANCH guild

RUN set -ex \
        \
        && buildDeps=' \
                git \
                ca-certificates \
                autoconf \
                ruby \
                build-essential \
                bison \
        ' \
        && apt-get update \
        && apt-get install -y --no-install-recommends $buildDeps \
        && rm -rf /var/lib/apt/lists/* \
        \
        && git clone $REPO -b $BRANCH --depth 1 \
        && cd ruby \
        && autoconf \
        && gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
        && ./configure \
                --build="$gnuArch" \
                --disable-install-doc \
                --enable-shared \
        && make -j "$(nproc)" \
        && make install \
        \
        && apt-get purge -y --auto-remove $buildDeps \
        && cd .. \
        && rm -rf ruby

CMD [ "irb" ]
