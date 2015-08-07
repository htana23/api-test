require 'net/http'
require 'uri'
require 'json'

class Itune
  include ActiveModel::Model
  attr_accessor :term

  def find(term)
    url = "https://itunes.apple.com/search"
    uri = URI.parse(url)
    uri.query = {
        country: "JP",
        entity: "musicTrack",
        term: term,
        limit: 3,
        lang: "ja_jp",
    }.to_param
    result = get_json(uri)
    ary = result["results"]
    ary.each do |track|
      p track["artistName"]
    end
  end

  private
    def get_json(uri)
      json = Net::HTTP.get(uri)
      JSON.parse(json)
    end
end
