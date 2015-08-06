require 'net/http'
require 'uri'
require 'json'

class Itune
  include ActiveModel::Model

  def self.find(term)
    url = "https://itunes.apple.com/search"
    uri = URI.parse(url)
    uri.query = {
        country: "JP",
        entity: "musicTrack",
        term: term,
        limit: 3,
        lang: "ja_jp",
    }.to_param
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    ary = result["results"]
    ary.each do |track|
      p track["artistName"]
    end
  end
end
