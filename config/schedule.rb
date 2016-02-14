require 'dotenv'
Dotenv.load

env :PATH, ENV["RBENV_ENVIRONMENTS"]
env :SHELL, '/usr/bin/zsh'
set :job_template, "eval \"$(rbenv init -)\" ; :job >> /tmp/#{ENV['APP_NAME']}-whenever.log 2>&1"

every 2.hour do
  command "backup perform --trigger lazyair_backup >> /tmp/recently_currency.log 2>&1"
end
