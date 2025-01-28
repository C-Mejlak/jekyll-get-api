lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-get-api'
  spec.summary       = 'Import remote JSON data and collections into a Jekyll site'
  spec.description   = 'Import remote JSON data and collections into a Jekyll site'
  spec.version       = '0.0.2'
  spec.authors       = ['Christian Mejlak']
  spec.email         = ['chris@mejlak.com']
  spec.homepage      = 'https://github.com/C-Mejlak/jekyll-get-api'
  spec.licenses      = ['MIT']
  spec.files         = ['lib/jekyll-get-api.rb', 'lib/jekyll-get-api/cache.rb', 'lib/jekyll-get-api/collection.rb',
                        'lib/jekyll-get-api/data.rb', 'lib/jekyll-get-api/resource.rb']
  spec.require_paths = ['lib']
  spec.add_dependency 'jekyll', '~> 4.0'
end
