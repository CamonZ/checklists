module Api
  module V1
    class ChecklistsController < BaseController
      def index
        ctx = ApiChecklistsForUserContext.new(current_user.id)
        results = ctx.execute
        render json: results.to_json 
      end

      def show
        ctx = ApiChecklistForUserContext.new(current_user.id, params[:id])
        results = ctx.execute
        render json: results.to_json(:include => { check_items: { only: [:id, :question]}}, only: [:id, :name, :description])
      end
    end
  end
end