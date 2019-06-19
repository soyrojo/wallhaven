
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wallhaven/version"

Gem::Specification.new do |spec|
  spec.name          = "wallhaven"
  spec.version       = Wallhaven::VERSION
  spec.authors       = ["Rojo"]
  spec.email         = ["rojo@rojo.dev"]

  spec.summary       = %q{Simple gem for Wallhaven API}
  spec.description   = %q{Simple gem for Wallhaven API}
  spec.homepage      = "https://github.com/soyrojo/wallhaven"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'
  spec.post_install_message  = "Wallhaven is installed!"

  all_files          = `git ls-files`.split("\n")
  test_files         = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.files         = all_files - test_files
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug", "~> 3.7"

  spec.add_dependency "httparty", "~> 0.17"
end
