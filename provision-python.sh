#!/bin/sh

# for installing pyenv
sudo yum -y groupinstall "Development Tools"
sudo yum install -y install readline-devel zlib-devel bzip2-devel  \
    sqlite-devel openssl-devel libXext.x86_64 libSM.x86_64  \
    libXrender.x86_64 libffi-devel python-devel \
    tk.x86_64 tk-devel.x86_64 tkinter.x86_64

# install pyenv
pyenv_install() {
  # skip installation when pyenv is already installed.
  if [ `pyenv --version > /dev/null 2>&1; echo $?` == 0 ]; then
    echo '.pyenv is already installed.(skipping...)'
    return
  fi

  # pyenv
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv;
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile;
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile;
  echo 'eval "$(pyenv init -)"' >> ~/.bash_profile;

  # pyenv-virtualenv
  git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv;
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile;

  # reload .bash_profile
  source ~/.bash_profile;
}
pyenv_install

# 3.6.5=系最新@2018-05-01
current_latest=3.6.5
pyenv install ${current_latest}
pyenv global ${current_latest}

# upgrade pip version
pip install --upgrade pip

