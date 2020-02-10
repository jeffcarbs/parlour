
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "parlour/version"

Gem::Specification.new do |spec|
  spec.name          = "parlour"
  spec.version       = Parlour::VERSION
  spec.authors       = ["Aaron Christiansen"]
  spec.email         = ["hello@aaronc.cc"]

  spec.summary       = %q{An RBI generator}
  spec.homepage      = "https://github.com/AaronC81/parlour"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|sorbet)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sorbet-runtime", ">= 0.5"
  spec.add_dependency "rainbow", "~> 3.0"
  spec.add_dependency "commander", "~> 4.5"
  spec.add_dependency "parser"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sorbet"
  spec.add_development_dependency "simplecov"
end
