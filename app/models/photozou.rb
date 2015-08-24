class Photozou
	extend Enumerize
	include ActiveModel::Model
	include WebApiLib
	attr_accessor :url, :keyword

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
		url = "https://api.photozou.jp/rest/search_public.json"
		uri = URI.parse(url)
		uri.query = uri_query(params)
		self.url = uri.to_s
		json = get_json(uri)
		json["info"]["photo"]
	end

	private
    def uri_query(param)
      @keyword = param[:keyword]
			param.to_param
      # base = {
      #   country: "JP",
      #   lang: "ja_jp",
      # }
      # @limit = param[:limit]
      # @term = param[:term]
      # @entity = param[:entity]
      # base.merge(param).to_param
    end
end
