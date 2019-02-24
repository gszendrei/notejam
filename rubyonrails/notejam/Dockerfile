# This file is a template, and might need editing before it works on your project.
FROM ruby:2.5-alpine

# Edit with nodejs, mysql-client, postgresql-client, sqlite3, etc. for your needs.
# Or delete entirely if not needed.
RUN apk --update --no-cache add nodejs postgresql-client sqlite sqlite-libs tzdata

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

ARG NOTEJAM_VER
ARG CONT_IMG_VER
LABEL Name=notejam Version=${NOTEJAM_VER:-$CONT_IMG_VER}
ENV NOTEJAM_VER ${NOTEJAM_VER:-$CONT_IMG_VER}

# Install build dependencies - required for gems with native dependencies
RUN apk --update add --no-cache --virtual build-deps build-base postgresql-dev sqlite-dev && \
  bundle install && \
  apk del build-deps

COPY . .

# For Rails
ENV PORT 5000
EXPOSE 5000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "5000"]










