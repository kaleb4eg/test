# README

### Initial setup steps

* clone repo using next command 'git clone repo_url'
* cd lim_parser
* cp ./config/database.yml.example ./config/database.yml and write down proper DB credentials for your side.
* gem install bundler
* bundle install
* rake db:create
* rake db:migrate
* rake db:seed

### Use Rspec to run tests

* rspec
