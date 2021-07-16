#!/bin/ruby

doc_key = ARGV[1]
project_path = ARGV[0]
project_name = project_path.split('/').last

File.open('id_rsa', 'w') { |f| f << doc_key }
puts `chmod 600 id_rsa`
puts `ssh-add id_rsa`
puts `git clone git@github.com:#{project_path}.git`
Dir.chdir(project_name) do
  puts `bundle install`
  puts `./scripts/deploy.sh #{project_name}`
end
