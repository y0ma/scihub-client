lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scihub/version'

Gem::Specification.new do |spec|
  spec.name = 'scihub-client'
  spec.version = SciHub::Version
  spec.description = 'A Ruby interface to the Copernicus Scihub API.'
  spec.summary = spec.description
  spec.licenses = %w[MIT]
  spec.authors = %w[Khomyakov Anton]
  spec.email = %w[y0ma97@gmail.com]
  spec.homepage = ''
  spec.files = %w[scihub_client.gemspec] + Dir['lib/**/*.rb']
  spec.require_paths = %w[lib]
  spec.add_runtime_dependency 'typhoeus'
end
