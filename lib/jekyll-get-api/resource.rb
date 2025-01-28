require 'open-uri'

module JekyllGetAPI
  class Resource
    def self.generate(site, resource)
      json_string = JekyllGetAPI::Cache.get(resource)

      unless json_string
        json_string = fetch(resource)
        JekyllGetAPI::Cache.write(resource, json_string)
      end

      json = JSON.parse(json_string)

      if resource['type'] == 'collection'
        JekyllGetAPI::Collection.generate(site, resource, json)
      else
        JekyllGetAPI::Data.generate(site, resource, json)
      end
    end

    def self.fetch(resource)
      uri = URI(resource['url'])
      URI.open(uri) { |f| f.read }
    rescue OpenURI::HTTPError => e
      warn "Error: #{e.message}".red
    end
  end
end
