require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the ginsu plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the ginsu plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Ginsu'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = 'ginsu'
    gemspec.summary = 'A Ruby on Rails plugin for carving partials out of static web sites.'
    gemspec.email = 'rap@endymion.com'
    # gemspec.homepage = "http://github.com/technicalpickles/the-perfect-gem"
    gemspec.description = <<-EOF
Ginsu is a Ruby on Rails plugin for carving partials out of static web sites, for including
graphic designers in the agile process for developing a web project.
EOF
    gemspec.authors = ["Ryan Porter"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
