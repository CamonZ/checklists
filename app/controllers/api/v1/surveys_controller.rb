module Api
  module V1
    class SurveysController < BaseController
      skip_before_action :verify_authenticity_token
      def create
        ctx = CreatingASurveyForUserContext.new(current_user.id, params)
        @survey = ctx.execute
        render json: {}, status: status_from_persistence(@survey) 
      end
    end
  end
end