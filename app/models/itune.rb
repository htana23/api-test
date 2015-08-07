require 'net/http'
require 'uri'
require 'json'

class Itune
  include ActiveModel::Model
  attr_accessor :term

  def limit
    @limit
  end

  def find(params)
    url = "https://itunes.apple.com/search"
    uri = URI.parse(url)
    uri.query = itune_param(params)
    result = get_json(uri)
    result["results"]
  end

  private
    def itune_param(param)
      base = {
        country: "JP",
        entity: "musicTrack",
        lang: "ja_jp",
      }
      @limit = param[:limit]
      base.merge(param).to_param
    end

    def get_json(uri)
      json = Net::HTTP.get(uri)
      JSON.parse(json)
    end
end
