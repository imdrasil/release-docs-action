# set -x

echo "$2" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
git clone git@github.com:/imdrasil/imdrasil.github.io.git
cd imdrasil.github.io
bundle install
bash ./scripts/deploy.sh "$1"
