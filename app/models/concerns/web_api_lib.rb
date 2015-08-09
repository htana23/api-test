require 'net/http'
require 'uri'
require 'json'

module WebApiLib
  extend ActiveSupport::Concern

  def get_json(uri)
    json = Net::HTTP.get(uri)
    JSON.parse(json)
  end
end
