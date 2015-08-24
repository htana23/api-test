class PhotozousController < ApplicationController
	before_action :set_photozou

	def show
		@results = {}
	end

	def search
		@results = @photozou.find(photozou_params)
		if @results
			render :show
		else
			redirect_to root_path
		end
	end

	private
	def photozou_params
		params.require(:photozou).permit(:keyword)
	end

	def set_photozou
		@photozou = Photozou.new
	end
end
