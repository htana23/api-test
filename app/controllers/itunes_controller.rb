class ItunesController < ApplicationController
  def index
    @results = Itune.find("songs")
  end
end
