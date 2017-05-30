# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "documentation-theme-jekyll-multioutput"
  spec.version       = "0.1.0"
  spec.authors       = ["Tom Johnson"]
  spec.email         = ["tomjohnson1492@gmail.com"]

  spec.summary       = %q{This gem provides the foundational files for The Multi-output version of the Documentation Theme for Jekyll.}
  spec.homepage      = "http://idratherbewriting.com/documentation-theme-jekyll/"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.4"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
