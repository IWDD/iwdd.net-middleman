# frozen_string_literal: true

require 'active_support/time'
require 'json'
require 'net/http'
require 'net/https'
require 'slim'

require 'lib/events_from_connpass_api_helpers'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

helpers do
  def date_time(data)
    "#{data.iwdd.next_event.date_y}.#{data.iwdd.next_event.date_m}.#{data.iwdd.next_event.date_d} #{data.iwdd.next_event.start} - #{data.iwdd.next_event.end}"
  end
end

helpers EventFromConnpassApiHelpers

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# livereload settings.
configure :development do
  activate :livereload
end

# assets settings.
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# slim-lang settings.
set :slim, pretty: true, sort_attrs: false, format: :html

# amp
page 'index.amp.html', layout: 'amp'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  # activate :relative_assets
  # set :http_prefix, "/Content/images/"
end
