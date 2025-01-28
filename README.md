# jekyll-get-api

Import remote data and collections into Jekyll.

## Installation

1. Use `bundle add jekyll-get-api` to add this to your site's Gemfile.
2. Add this plugin to the plugins listed in your `_config.yml` file. For example:

```yml
plugins:
  - jekyll-get-api
```

## Usage

Add a `jekyll_get_api` section to your `_config.yml` file. This section should be an array of objects containing:

- `type`: either `data` or `collection`.
- `name`: the name you want to access it with for example `{% for item in site.data.<name> %}`.
- `url`: the URL from where to fetch the data.
- `data_key`: a JSON response usually consists of an object. We're only interested in the array which contains the data. By default this is set to `data`, but you can override it.
- `document_id`: **this is only needed for collections** and must be a unique identifier. This is also used for naming the markdown files.
- `cache_expiry`: by default all requests are cached for an hour. You can override it by providing a **number in seconds**.

### Example

```yml
# _config.yml
jekyll_get_api:
  - name: authors
    type: data
    url: https://example.com/authors
  - name: blog_posts
    type: collection
    url: https://example.com/posts
    document_id: id
```

In production you rarely want to cache responses. You probably want the latest response while the site is building. You can set different settings for different [evironments](https://jekyllrb.com/docs/configuration/environments/).
