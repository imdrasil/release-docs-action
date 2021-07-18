FROM ruby:2.3.8

RUN apt-get update && apt-get install expect -y

RUN gem install pry

COPY entrypoint.rb /entrypoint.rb

COPY add_key.sh /add_key.sh

ENTRYPOINT ["ruby", "/entrypoint.rb"]
