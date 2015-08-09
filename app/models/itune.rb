class Itune
  extend Enumerize
  include ActiveModel::Model
  include WebApiLib
  attr_accessor :term, :limit, :api

  ENTITY_TYPE = %w(
    allTrack
    musicTrack
    album
    movie
    podcast
    audiobook
    shortFilm
    tvEpisode
    tvSeason
    software
  ).freeze
  enumerize :entity, in: ENTITY_TYPE

  def find(params)
    url = "https://itunes.apple.com/search"
    uri = URI.parse(url)
    uri.query = uri_query(params)
    self.api = uri.to_s
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
end
