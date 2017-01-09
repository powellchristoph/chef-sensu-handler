Gem::Specification.new do |s|
  s.name        = "chef-sensu-handler"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Christopher Powell"]
  s.email       = ["powellchristoph@gmail.com"]
  s.homepage    = "https://github.com/powellchristoph/chef-sensu-handler"
  s.summary     = %q{An exception handler for OpsCode Chef which creates Sensu alerts}
  s.description = %q{An exception handler for OpsCode Chef which creates Sensu alerts}
  s.has_rdoc    = false
  s.license     = "MIT"

  s.rubyforge_project = "chef-sensu-handler"

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
end
