#!/bin/bash

sudo add-apt-repository ppa:chris-lea/node.js  
sudo apt-get update
sudo apt-get install nodejs

git config --global user.name "Matthew Hughes"
git config --global user.email "me@matthewhughes.co.uk"

mkdir ~/sw
cd ~/sw

git clone git@github.com:scraperwiki/custard.git
git clone git@github.com:scraperwiki/cobalt.git
git clone git@github.com:scraperwiki/swops-secret.git
git clone git@github.com:scraperwiki/swops.git
git clone git@github.com:scraperwiki/lithium.git

