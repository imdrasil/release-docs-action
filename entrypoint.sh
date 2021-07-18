# set -x

echo "$2" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
git clone git@github.com:/imdrasil/imdrasil.github.io.git
cd imdrasil.github.io
bundle install
git config user.email "moranibaca@gmail.com"
git config user.name "Integration"
bash ./scripts/deploy.sh "$1" "$3" "$4"
