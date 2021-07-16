#!/bin/ruby

doc_key = ARGV[1]
project_name = ARGV[0]

puts `mkdir -p .ssh`
File.open('.ssh/id_rsa', 'w') { |f| f << doc_key }
puts 'Here'
puts `chmod 600 .ssh/id_rsa`
puts `eval $(ssh-agent)`
puts `ssh-add .ssh/id_rsa`
puts `git clone git@github.com:/imdrasil/imdrasil.github.io.git`
Dir.chdir(project_name) do
  puts `bundle install`
  puts `./scripts/deploy.sh #{project_name}`
end
