# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ginsu}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Porter"]
  s.date = %q{2009-05-22}
  s.description = %q{Ginsu is a Ruby on Rails plugin for carving partials out of static web sites, for including graphic designers in the agile process for developing a web project.}
  s.email = %q{rap@endymion.com}
  s.extra_rdoc_files = [
    "README",
     "README.textile"
  ]
  s.files = [
    "MIT-LICENSE",
     "README",
     "README.textile",
     "Rakefile",
     "VERSION",
     "generators/ginsu/USAGE",
     "generators/ginsu/ginsu_generator.rb",
     "generators/ginsu/templates/config/initializers/ginsu.rb",
     "ginsu.gemspec",
     "init.rb",
     "install.rb",
     "lib/ginsu.rb",
     "lib/ginsu/config.rb",
     "lib/ginsu/knife.rb",
     "tasks/ginsu_tasks.rake",
     "test/ginsu_test.rb",
     "test/test_helper.rb",
     "uninstall.rb"
  ]
  s.has_rdoc = true
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A Ruby on Rails plugin for carving partials out of static web sites.}
  s.test_files = [
    "test/ginsu_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
