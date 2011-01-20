# -*- encoding: utf-8 -*-
require 'resque/tasks'
require 'resque/pool'

namespace :resque do

  desc "resque worker config (not pool related).  e.g. hoptoad"
  task :setup

  namespace :pool do
    "resque pool config.  e.g. after_prefork connection handling"
    task :setup
  end

  desc "Launch a pool of resque workers"
  task :pool => %w[resque:setup resque:pool:setup] do
    if ENV['SCHEDULER']
      Rake::Task['resque:scheduler']
    end
    Resque::Pool.run
  end

end
