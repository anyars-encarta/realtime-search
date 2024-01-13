#!/usr/bin/env bash
# bundle install --without development:test
# RAILS_ENV=production bundle exec rake assets:precompile
# RAILS_ENV=production rails db:create
# RAILS_ENV=production bundle exec rake db:migrate

# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate