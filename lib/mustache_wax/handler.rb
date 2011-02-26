# The vast majority of this file is borrowed from haml.

# This file makes MustacheWax work with Rails
# using the > 2.0.1 template handler API.

module MustacheWax
  # In Rails 3.1+, template handlers don't inherit from anything. In <= 3.0, they do.
  # To avoid messy logic figuring this out, we just inherit from whatever the ERB handler does.
  class Handler < ActionView::TemplateHandlers::ERB.superclass
    if ((defined?(ActionView::TemplateHandlers) &&
          defined?(ActionView::TemplateHandlers::Compilable)) ||
        (defined?(ActionView::Template) &&
          defined?(ActionView::Template::Handlers) &&
          defined?(ActionView::Template::Handlers::Compilable))) &&
        # In Rails 3.1+, we don't need to include Compilable.
        ActionView::TemplateHandlers::ERB.include?(
          ActionView::TemplateHandlers::Compilable)
      include ActionView::TemplateHandlers::Compilable
    end

    # def handles_encoding?; true; end

    def compile(template)
      # template is a template object in Rails >=2.1.0,
      # a source string previously
      if template.respond_to? :source
        # Template has a generic identifier in Rails >=3.0.0
        options[:filename] = template.respond_to?(:identifier) ? template.identifier : template.filename
        source = template.source
      else
        source = template
      end

      # MustacheWax::Engine.new(source, options).send(:precompiled_with_ambles, [])
      source
    end

    # In Rails 3.1+, #call takes the place of #compile
    def self.call(template)
      new.compile(template)
    end

    # def cache_fragment(block, name = {}, options = nil)
    #   @view.fragment_for(block, name, options) do
    #     eval("_hamlout.buffer", block.binding)
    #   end
    # end
    
    def self.register
      if defined? ActionView::Template and ActionView::Template.respond_to? :register_template_handler
        ActionView::Template
      else
        ActionView::Base
      end.register_template_handler(:haml, MustacheWax::Handler)
    end 
    
  end

end

