FROM ruby:2.3.8

COPY entrypoint.rb /entrypoint.rb

RUN curl -fsSL https://crystal-lang.org/install.sh | bash

ENTRYPOINT ["ruby", "/entrypoint.rb"]
