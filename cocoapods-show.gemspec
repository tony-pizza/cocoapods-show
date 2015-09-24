# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "cocoapods-show"
  spec.version       = "0.0.1"
  spec.authors       = ["Ian Pearce"]
  spec.email         = ["ian@ianpearce.org"]

  spec.summary       = %q{Use `pod show` to list installed CocoaPods for a project}
  spec.homepage      = "https://github.com/peeinears/cocoapods-show"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
