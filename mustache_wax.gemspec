# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mustache_wax}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steven Soroka"]
  s.date = %q{2011-02-26}
  s.description = %q{Automatically compiles *.html.mustache view files in app/views to /javascripts/mustache_templates.js}
  s.email = %q{ssoroka78@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README",
    "Rakefile",
    "VERSION",
    "lib/mustache_wax.rb",
    "spec/mustache_wax_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/ssoroka/mustache_wax}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Automatically compiles .html.mustache view files to /javascripts/mustache_templates.js}
  s.test_files = [
    "spec/mustache_wax_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<fakefs>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<fakefs>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<fakefs>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end

