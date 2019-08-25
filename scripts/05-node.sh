#!/usr/bin/env bash

cd $(dirname "$(realpath "$0")")/../

# Install nvm and node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

source ~/.bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install node
npm completion | sudo tee /etc/bash_completion.d/npm

echo -e '
NODE_BIN="$(nvm which current)"
export NODE_BIN_PATH="$(dirname $NODE_BIN)"
export NODE_HOME="$(cd $NODE_BIN_PATH/../;pwd)"
export NODE_INCLUDE_PATH="$NODE_HOME/include/node"
' >> ~/.bashrc

# node-3d dependencies
sudo add-apt-repository -y "deb http://security.ubuntu.com/ubuntu xenial-security main" \
 && sudo apt install -y libjasper1 libjasper-dev