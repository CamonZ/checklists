module Api
  module V1
    class DashboardController < BaseController
      def index
        ctx = ApiDashboardForUserContext.new(current_user.id)
        results = ctx.execute
        render json: results.to_json 
      end
    end
  end
end
