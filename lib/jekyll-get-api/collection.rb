module JekyllGetAPI
  class Collection
    def self.generate(site, resource, json)
      collection = site.collections[resource['name']]
      data_key = resource['data_key'] || 'data'
      id = resource['document_id'] || 'id'

      json[data_key].each do |item|
        document = Jekyll::Document.new(
          "#{item[id]}.md",
          { site: site, collection: collection }
        )
        document.data.merge!(item)
        collection.docs << document
      end
    end
  end
end
