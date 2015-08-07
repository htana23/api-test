require 'net/http'
require 'uri'
require 'json'

class Itune
  extend Enumerize
  include ActiveModel::Model
  attr_accessor :term, :limit

  ENTITY_TYPE = %w(
    musicTrack
    album
    movie
  ).freeze
  enumerize :entity, in: ENTITY_TYPE

  def find(params)
    url = "https://itunes.apple.com/search"
    uri = URI.parse(url)
    uri.query = uri_query(params)
    result = get_json(uri)
    result["results"]
  end

  private
    def uri_query(param)
      base = {
        country: "JP",
        lang: "ja_jp",
      }
      @limit = param[:limit]
      @term = param[:term]
      @entity = param[:entity]
      base.merge(param).to_param
    end

    def get_json(uri)
      json = Net::HTTP.get(uri)
      JSON.parse(json)
    end
end
