module MustacheWax
  class Middleware
    def initialize(app)
      @app=app
      @newest = Time.now
    end 
    
    def call(env)
      mtimes = MustacheWax.template_files.map do |f|
        File.mtime(f)
      end 
      
      if mtimes.any? && (newest = mtimes.max) > @newest
        MustacheWax.generate_templates
        @newest = newest
        
        # kill caching of old versions.
        MustacheWax.register_expansion(@newest)
      end 
      
      @app.call(env)
    end 
  end 
end 
