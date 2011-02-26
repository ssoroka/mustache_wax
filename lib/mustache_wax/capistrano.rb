require 'rubygems' unless defined?(Rubygems)
require 'capistrano' unless defined?(Capistrano)

unless Capistrano::Configuration.respond_to?(:instance)
  abort "capistrano/mustache_wax requires Capistrano 2"
end

require 'mustache_wax' unless defined?(MustacheWax)

Capistrano::Configuration.instance(:must_exist).load do
  after "deploy",            "deploy:generate_templates"
  after "deploy:migrations", "deploy:generate_templates"

  namespace :deploy do
    desc "generate mustache templates on the remote server"
    task :generate_templates, :except => { :no_release => true } do
      run "cd #{release_path} && rake mustache:generate_templates"
      puts "Wrote new public/javascripts/mustache_templates.js from #{template_files.size} template(s)"
    end
  end
end
