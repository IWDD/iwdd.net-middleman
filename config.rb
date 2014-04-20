require "slim"
require "stylus"

# livereload settings.
configure :development do
  activate :livereload
end

# assets settings.
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# slim-lang settings.
Slim::Engine.set_default_options :pretty => true

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  # activate :asset_hash
  # activate :relative_assets
  # set :http_prefix, "/Content/images/"
end

# iwdd.github.io deploy
activate :deploy do |deploy|
  deploy.method = :git
  deploy.remote   = "https://github.com/IWDD/iwdd.github.io.git"
  deploy.branch   = "master"
end
