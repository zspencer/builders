#!/usr/bin/env bash

if [ -L /usr/local/bin/ruby ]; then
  rm /usr/local/bin/ruby
fi

if [ -L /usr/local/bin/gem ]; then
  rm /usr/local/bin/gem
fi

if [ -L /usr/local/bin/bundle ]; then
  rm /usr/local/bin/bundle
fi
