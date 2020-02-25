# frozen_string_literal: true

require 'nokogiri'

module EventFromConnpassApiHelpers
  # connpass の API から JSON を取得する
  def get_events_from_connpass_api
    now = Time.now

    yms = [
      now.since(0.month).strftime('%Y%m'),
      now.since(1.month).strftime('%Y%m'),
      now.since(2.month).strftime('%Y%m'),
      now.since(3.month).strftime('%Y%m')
    ]

    # 毎月15日を過ぎたら、次の月のデータを取得する
    ym = if now.day > 14
           yms[0]
         else
           yms[1]
         end

    
    uri = URI("https://connpass.com/api/v1/event/?series_id=2772&count=10&order=2&ym=#{ym}")

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

  def generate_time_table(description)
    doc = Nokogiri::HTML(description.gsub("\n", ''))
    doc.css('ul li').map {|n| n.text}.join(',')
  end

  def generate_started_ended(started, ended)
    "#{Time.parse(started).strftime("%Y.%m.%d %H:%M")} - #{Time.parse(ended).strftime("%H:%M")}"
  end
end
