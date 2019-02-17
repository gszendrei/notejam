FROM ruby:2.5-slim AS notejam

RUN apt-get update \ 
    && apt-get install -y --no-install-recommends \
        nodejs build-essential libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 3000

RUN bundle config --global frozen 1

CMD ["rails", "server", "-b", "0.0.0.0"]
HEALTHCHECK --interval=5m --timeout=3s CMD nodejs /usr/src/notejam/healthcheck.js

ARG NOTEJAM_VER
ARG CONT_IMG_VER
LABEL Name=notejam Version=${NOTEJAM_VER:-$CONT_IMG_VER}
ENV NOTEJAM_VER ${NOTEJAM_VER:-$CONT_IMG_VER}

WORKDIR /usr/src/notejam
COPY . .

RUN bundle install

