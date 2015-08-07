class ItunesController < ApplicationController
  before_action :set_itune

  def index
    @results = {}
  end

  def search
    @results = @itune.find(itune_params)
    render :index
  end

  private
    def itune_params
      params.require(:itune).permit(:term, :limit, :entity)
    end

    def set_itune
      @itune = Itune.new
    end
end
