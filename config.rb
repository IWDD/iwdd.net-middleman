require "slim"

# livereload settings.
configure :development do
  activate :livereload
end

# assets settings.
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# slim-lang settings.
set :slim, { :pretty => true, :sort_attrs => false, :format => :html }

page '/sitemap.xml', :layout => false

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  # activate :relative_assets
  # set :http_prefix, "/Content/images/"
end

# iwdd.github.io deploy
activate :deploy do |deploy|
  deploy.method = :git
  deploy.remote   = "iwdd.github.io"
  deploy.branch   = "master"
  deploy.build_before = true
end
