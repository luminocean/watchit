# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'watchit/version'

Gem::Specification.new do |spec|
    spec.name          = "watchit"
    spec.version       = Watchit::VERSION
    spec.authors       = ["luminocean"]
    spec.email         = ["282896922@qq.com"]

    spec.summary       = 'Frontend modification listening and auto-refreshing tool'
    spec.files         = `git ls-files -z`.split("\x0")
    spec.bindir        = "bin"
    spec.executables   = ["watchit"]
    spec.require_paths = ["lib"]
    spec.license       = 'MIT'
    spec.homepage         = 'https://github.com/luminocean/watchit'

    spec.add_dependency "sinatra", "~> 1.4"
    spec.add_dependency "slop", "~> 3.4"

    spec.add_development_dependency "bundler", "~> 1.10"
    spec.add_development_dependency "rake", "~> 11.1.2"
    spec.add_development_dependency "pry", "~> 0.10"
end
