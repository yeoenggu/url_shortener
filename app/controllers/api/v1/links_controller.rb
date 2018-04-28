class Api::V1::LinksController <  ActionController::API
	include ActionController::MimeResponds
	
	def get_stats
		id = link_params
		@link = Link.find_by(id: id)
		if @link
			render json: @link
		else
			render json: "Link with #{id} not found ", status: 404
		end
	end

	private

	def link_params
		params.require(:id)
	end
end