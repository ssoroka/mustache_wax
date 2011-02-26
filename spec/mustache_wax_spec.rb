require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MustacheWax" do
  include FakeFS::SpecHelpers
  before(:each) do
    FileUtils.mkdir_p('app/views/something')
    File.open('app/views/something/example.html.mustache', 'w') do |f|
      f.write(%(<div>{{example}}</div>))
    end
  end
  
  it 'should generate a mustache_templates.js from templates in app/views' do
    MustacheWax.generate_templates
    File.read('public/javascripts/mustache_templates.js').should == "window.MustacheTemplates = {\"something/example\":\"<div>{{example}}</div>\"};\n"
  end
  
end
