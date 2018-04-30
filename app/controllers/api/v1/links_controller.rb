class Api::V1::LinksController <  ActionController::API
	include ActionController::MimeResponds
	
	def get_link_stats
		id = link_params
		@link = Link.find_by(id: id)

		if @link
			render json: @link.as_json(only: [:id, :full_url, :clicks])
		else
			render json: "Link with #{id} not found ", status: 404
		end
	end

	def get_stats
		@country = Link.joins(:visit).group("country").count
		@browser = Link.joins(:visit).group("browser").count
		@city = Link.joins(:visit).group("city").count
		@user_agent = Link.joins(:visit).group("user_agent").count
		@device_type = Link.joins(:visit).group("device_type").count

		render json: { country: @country, browser: @browser, city: @city, user_agent: @user_agent, device_type: @device_type }
	end

	private

	def link_params
		params.require(:id)
	end
end