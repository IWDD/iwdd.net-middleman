# frozen_string_literal: true

require 'active_support/time'
require 'json'
require 'net/http'
require 'net/https'
require 'slim'

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
  # connpass の API から JSON を取得する
  def get_events_from_conpass_api
    now = Time.now

    yms = [
      now.since(0.month).strftime('%Y%m'),
      now.since(1.month).strftime('%Y%m'),
      now.since(2.month).strftime('%Y%m'),
      now.since(3.month).strftime('%Y%m')
    ]

    # 毎月15日を過ぎたら、次の月のデータを取得する
    ym = if now.day > 14
           yms[0..2].join(',')
         else
           yms[1..3].join(',')
         end

    uri = URI("https://connpass.com/api/v1/event/?series_id=2772&count=10&order=1&ym=#{ym}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    req = Net::HTTP::Get.new(uri)
    res = http.request(req)

    # ruby 2.7 の Pattern Matching を json に対して試してみる
    case JSON.parse(res.body, symbolize_names: true)
    in {results_start: results_start, results_returned: results_returned, results_available: results_available, events: events}
      events
    else
      raise
    end
  end

  def date_time(data)
    "#{data.iwdd.next_event.date_y}.#{data.iwdd.next_event.date_m}.#{data.iwdd.next_event.date_d} #{data.iwdd.next_event.start} - #{data.iwdd.next_event.end}"
  end
end

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
