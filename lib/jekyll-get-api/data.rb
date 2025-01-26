module JekyllGetAPI
  class Data
    def self.generate(site, resource, json)
      data_key = resource['data_key'] || 'data'
      site.data[resource['name']] = json[data_key]
    end
  end
end
