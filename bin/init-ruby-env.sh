#!/bin/sh

if hash rvm 2>/dev/null; then
  echo 'RVM looks to be installed already.'
elif [ -f ~/.rvm/bin/rvm-exec ]; then
  echo 'RVM looks to be installed already.'
else
  echo 'Looks like RVM needs to be installed...'
  gpg --keyserver hkp://keys.gnupg.net --recv-keys \
    409B6B1796C275462A1703113804BB82D39DC0E3 \
    7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  curl -sSL https://get.rvm.io | bash -s stable
fi

ruby_version_and_gemset=`cat .ruby-version | xargs`
ruby_version=`echo ${ruby_version_and_gemset/@ci-tinker/}`

echo "Going to install $ruby_version..."
~/.rvm/bin/rvm install $ruby_version

echo "Creating 'salonlofts' gemset..."
~/.rvm/bin/rvm-exec $ruby_version rvm gemset create salonlofts

echo "Installing Bundler..."
~/.rvm/bin/rvm-exec $ruby_version_and_gemset gem install bundler

echo "Installing dependencies via Bundler..."
~/.rvm/bin/rvm-exec $ruby_version_and_gemset bundle install

