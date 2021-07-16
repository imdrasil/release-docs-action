#!/bin/ruby

doc_key = ARGV[1]
project_name = ARGV[0]

File.open('id_rsa', 'w') { |f| f << doc_key }
puts `chmod 600 id_rsa`
puts `ssh-add id_rsa`
puts `git clone git@github.com:/imdrasil/imdrasil.github.io.git`
Dir.chdir(project_name) do
  puts `bundle install`
  puts `./scripts/deploy.sh #{project_name}`
end
