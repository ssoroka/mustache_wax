require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MustacheWax" do
  include FakeFS::SpecHelpers
  before(:each) do
    FileUtils.mkdir_p('app/views/something')
    # create an example template that will be picked up by the generate_templates method
    File.open('app/views/something/example.html.mustache', 'w') do |f|
      f.write(%(<div>{{example}}</div>))
    end
  end
  
  it 'should generate a mustache_templates.js from templates in app/views' do
    MustacheWax.generate_templates
    js_content = File.read('public/javascripts/mustache_templates.js')
    
    js_content.should include %(<div>{{example}}</div>)
    js_content.should =~ /^var mustache_templates = \{/
  end
  
end
