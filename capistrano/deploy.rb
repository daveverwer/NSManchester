set :use_sudo, false
set :user, "rails"
set :application, "nsmanchester"
set(:deploy_to) { File.join("", "home", user, application) }

set :scm, :git
set :repository,  "git@github.com:daveverwer/NSManchester.git"
set :branch, "master"
set :deploy_via, :remote_cache

server "shiny-004.vm.brightbox.net", :app, :web, :db, :primary => true
server "shiny-005.vm.brightbox.net", :app, :web

after "deploy:update_code" do
  run "mv #{latest_release}/htaccess #{latest_release}/.htaccess"
  run "rm #{latest_release}/capistrano/deploy.rb && rmdir #{latest_release}/capistrano && rm #{latest_release}/capfile"
end

deploy.task :restart do
end

deploy.task :finalize_update do
end