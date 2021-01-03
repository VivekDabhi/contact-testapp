module Api::V1
	class ApiBaseController < ActionController::Base
		protect_from_forgery with: :null_session

		private

    def unauthorize
    	render json: {
				status: 2,
				message: 'No access required'
			} and return
    end
	end
end
