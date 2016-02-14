# config valid only for current version of Capistrano
lock '3.4.0'
binding.pry

set :application, ENV['APP_NAME']
set :repo_url, ENV['GIT_REPO']
set :format, :pretty
set :keep_releases, 2

# deploy 的資料夾位置 (prodution)
set :deploy_to, ENV["PROJECT_PATH"]
set :branch, ENV["BRANCH"] || `git rev-parse --abbrev-ref HEAD`.chop

set :user, ENV['DEPLOYER']
set :use_sudo, false
# rbenv 的設定
set :rbenv_type, :user 

set :rbenv_ruby, "2.2.2"
set :rbenv_path, ENV['RBENV_PATH']
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all
set :rbenv_type, :user
set :bundle_flags, "--deployment --verbose --binstubs --shebang ruby-local-exec"
set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }
set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$HOME/bin:$HOME/local/bin:$PATH"
}

namespace :deploy do

end
