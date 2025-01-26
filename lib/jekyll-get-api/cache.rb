module JekyllGetAPI
  class Cache
    def self.root_path=(path)
      @@root_path = path
    end

    def self.get(resource)
      type = resource['type']
      name = resource['name']
      cache_expiry = resource['cache_expiry'] || 3600
      cache_file = File.join(@@root_path, '_cache', "jekyll-get-api-#{type}-#{name}.json")

      return nil unless cache_valid?(cache_file, cache_expiry)

      warn "Reading from cache for #{name}".green
      File.read(cache_file)
    end

    def self.write(resource, content)
      type = resource['type']
      name = resource['name']
      cache_file = File.join(@@root_path, '_cache', "jekyll-get-api-#{type}-#{name}.json")
      FileUtils.mkdir_p(File.dirname(cache_file))
      File.write(cache_file, content)
    end

    private

    def self.cache_valid?(cache_file, cache_expiry)
      File.exist?(cache_file) && (Time.now - File.mtime(cache_file)) < cache_expiry
    end
  end
end
