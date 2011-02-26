require 'yajl'

module MustacheWax

  autoload :Middleware, "mustache_wax/middleware"

  def self.register_expansion(timestamp=nil)
    querystring = "?#{timestamp.to_i}" if timestamp
    expansions = { 
      :mustache_wax => [
        "/javascripts/handlebars.js",
        "/javascripts/mustache_templates.js#{querystring}"
      ]
    }
    ActionView::Helpers::AssetTagHelper.register_javascript_expansion(expansions)
  end
  
  if defined?(Rails::Railtie)
    class Railtie < Rails::Railtie
      initializer 'mustache_wax.initialize' do |app|
        MustacheWax.generate_templates
        MustacheWax.register_expansion
        if Rails.env.development?
          app.config.middleware.use MustacheWax::Middleware
        end 
      end 
    end
  end 
  
  def self.template_files
    Dir[File.join(%w(app views), '**', '*.html.mustache')]
  end 

  def self.output_path
    base = defined?(Rails.root) ? Rails.root : '.'
    "#{base}/public/javascripts/mustache_templates.js"
  end 
  
  def self.generate_templates
    templates = {}
    template_files.each do |template_file|
      name = template_file.gsub(/^.*app\/views\//, '').gsub(/\.html\.mustache$/, '')
      content = File.read(template_file)
      templates[name] = content
    end

    script = "window.MustacheTemplates = #{Yajl::Encoder.encode(templates)};"

    File.open(output_path, 'w') { |f| f.puts script }
  end
end
