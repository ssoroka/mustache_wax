namespace :mustache do
  desc "Generate mustache_templates.js from .html.mustache view files"
  task :generate_templates => [:environment] do
    MustacheWax.generate_templates
  end
end
