#!/bin/bash
bundle install

# Remove the previously generated site
rm -rf _site/

mkdir _site/

# Checkout current master (published github pages site) into _site 
git -C _site/ init 
git -C _site/ remote add origin git@github.com:GoneMobileCast/GoneMobileCast.github.io.git
git -C _site/ fetch 
git -C _site/ checkout -t origin/master

# Generate our site into _site
bundle exec jekyll build

git -C _site/ add -A # add everything to commit
git -C _site/ commit -am "Regenerated Jekyll site" 
git -C _site/ push origin master
