class ItunesController < ApplicationController
  before_action :set_itune

  def index
    @results = {}
  end

  def search
    @results = @itune.find("songs")
    render :index
  end

  private
    def set_itune
      @itune = Itune.new
    end
end
