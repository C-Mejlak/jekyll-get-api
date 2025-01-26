require 'jekyll'
require 'json'

require_relative './jekyll-get-api/cache'
require_relative './jekyll-get-api/collection'
require_relative './jekyll-get-api/data'
require_relative './jekyll-get-api/resource'

module JekyllGetAPI
  class GetAPIGenerator < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      JekyllGetAPI::Cache.root_path = site.source

      resources = site.config['jekyll_get_api']

      unless resources
        warn "Did you forget to set 'jekyll_get_api' in config?".red
        return
      end

      resources = [resources] unless resources.is_a?(Array)

      resources.each do |resource|
        JekyllGetAPI::Resource.generate(site, resource)
      end
    end
  end
end
