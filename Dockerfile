FROM ruby:2.7.0

ENV BUNDLER_VERSION 1.17.2

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends \
        build-essential \
        gosu \
        libpq-dev \
        nodejs \
        sqlite3 && \
    mkdir /ws8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV APP_ROOT /ws8
WORKDIR $APP_ROOT
COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock
RUN gem install bundler -v 1.17.2  && \
    bundle install
COPY . $APP_ROOT
RUN mv entrypoint.sh /usr/local/bin/ && \
    chmod +x /usr/local/bin/entrypoint.sh
EXPOSE  3000
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
