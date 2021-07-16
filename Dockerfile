FROM 2.6-alpine3.13

COPY entrypoint.rb /entrypoint.rb

ENTRYPOINT ["/entrypoint.rb"]
