Gem::Specification.new do |spec|
  spec.name          = 'jekyll-get-api'
  spec.summary       = 'Import remote JSON data and collections into a Jekyll site'
  spec.description   = 'Import remote JSON data and collections into a Jekyll site'
  spec.version       = '0.0.1'
  spec.authors       = ['Christian Mejlak']
  spec.email         = ['chris@mejlak.com']
  spec.homepage      = 'https://github.com/C-Mejlak/jekyll-get-api'
  spec.licenses      = ['MIT']
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']
  spec.add_dependency 'jekyll', '~> 4.0'
end
