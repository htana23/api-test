class PhotozousController < ApplicationController
	before_action :set_photozou

	def show
		@results = {}
	end

	def search
		@results = @itune.find(itune_params)
		if @results
			render :index
		else
			redirect_to itunes_path
		end
	end

	private
	def itune_params
		params.require(:itune).permit(:term, :limit, :entity)
	end

	def set_photozou
		@photozou = Photozou.new
	end
end
