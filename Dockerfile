FROM ruby:3.1

RUN apt-get update && \
    apt-get install expect -y

RUN gem install pry

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts

RUN curl -fsSL https://crystal-lang.org/install.sh | bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]
