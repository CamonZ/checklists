module Api
  module V1
    class SurveysController < BaseController
      def index
        ctx = ApiSurveysForUserContext.new(current_user.id)
        results = ctx.execute
        render json: results.to_json 
      end
    end
  end
end