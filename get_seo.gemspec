# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'get_seo/version'

Gem::Specification.new do |spec|
  spec.name          = "get_seo"
  spec.version       = GetSeo::VERSION
  spec.author        = ["Dom McKellar"]
  spec.email         = ["dom.mckellar@gmail.com"]

  spec.summary       = %q{Quickly and easily inspect SEO information from websites of your choice.}
  spec.description   = %q{Get Seo allows you to avoid browser extensions and immediately fetch SEO information you desire. Simply enter the url of a website you’d like to inspect, select the SEO related information you would like to retrieve, and Get Seo will display your results via the terminal.}
  spec.homepage      = "https://github.com/Dom-Mc/get_seo"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Development
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.4"
  spec.add_development_dependency "require_all", "~> 1.3", ">= 1.3.3"

  # Production
  spec.add_dependency "nokogiri", "~> 1.6"
end
