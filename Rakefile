require 'rubygems'
require 'rake/gempackagetask'

spec = Gem::Specification::new do |spec|
  spec.name = "oldskool-puppet"
  spec.version = "0.0.5"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "oldskool-puppet"
  spec.description = "description: Generate documentation for Puppet types"

  spec.files = FileList["lib/**/*.rb", "views/*.erb"]
  spec.executables = []

  spec.require_path = "lib"

  spec.has_rdoc = false
  spec.test_files = nil
  spec.add_dependency 'puppet', '3.7.3'
  spec.add_dependency 'redcarpet'

  spec.extensions.push(*[])

  spec.author = "R.I.Pienaar"
  spec.email = "rip@devco.net"
  spec.homepage = "http://devco.net/"
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = false
  pkg.need_tar = false
end
