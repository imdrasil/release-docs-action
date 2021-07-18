#!/bin/ruby

doc_key = ARGV[1]
project_name = ARGV[0]
require 'rubygems'
require 'pry'
puts `curl -fsSL https://crystal-lang.org/install.sh | bash`
puts `mkdir .ssh`
puts `mkdir ~/.ssh`
File.open('.ssh/id_rsa', 'w') { |f| f << doc_key }
configs = <<~TEXT
Host github.com
    StrictHostKeyChecking no
TEXT
puts `echo "#{configs}" > ~/.ssh/config`
puts `chmod 600 .ssh/id_rsa`
puts `chmod 400 ~/.ssh/config`
# binding.pry
puts `exec ssh-agent /add_key.sh`
puts `eval $(ssh-agent)`
puts File.read('.ssh/id_rsa').size
# puts `ssh-add .ssh/id_rsa`
puts `git clone git@github.com:/imdrasil/imdrasil.github.io.git`
Dir.chdir(project_name) do
  puts `bundle install`
  puts `./scripts/deploy.sh #{project_name}`
end
