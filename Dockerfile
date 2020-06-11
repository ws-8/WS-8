FROM ruby:2.5.0


RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update -qq && \
    apt-get install -y build-essential \
                       gosu \
                       libpq-dev \
                       nodejs --no-install-recommends \
                       sqlite3 && \
                       mkdir /ws8 && \
                       rm -rf /var/lib/apt/lists/*
    
ENV APP_ROOT /ws8
WORKDIR $APP_ROOT
ADD ./Gemfile $$APP_ROOT/Gemfile
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock
ADD . $APP_ROOT
RUN chmod +x /usr/local/bin/entrypoint.sh && \
    bundle install

EXPOSE  3000
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD ["rails", "server", "-b", "0.0.0.0"]