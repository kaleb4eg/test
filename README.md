# README

### Initial setup steps

* clone repo using next command 'git clone repo_url'
* cd lim_parser
* cp ./config/database.yml.example ./config/database.yml and write down proper DB credentials for your side.
* gem install bundler
* bundle install
* rake db:create
* rake db:migrate
* rails s
* in another tab: open same dir and run "bundle exec rake jobs:work" for background job

### Additional notes

* In production I would use Sidekiq for background jobs, delayed_job used here only for simplicity purpose.
* One URL can be parsed only once, if you enter same url second time, response will contain already parsed information.

### Use Rspec to run tests

* rspec
