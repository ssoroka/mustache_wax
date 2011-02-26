class MustacheWax
  def self.generate_templates
    templates = {}
    template_files = Dir[File.join(%w(app views), '**', '*.html.mustache')]
    template_files.each{|template_file|
      template_name = template_file.gsub(/^.*app\/views\//, '').gsub(/\.html\.mustache$/, '')
      template = File.read(template_file)
      templates[template_name] = template
    }

    templates_json = ActiveSupport::JSON.encode(templates)
    template_script = %(var mustache_templates = #{templates_json};)

    File.open('public/javascripts/mustache_templates.js', 'w') do |f|
      f.write template_script
    end
  end
end