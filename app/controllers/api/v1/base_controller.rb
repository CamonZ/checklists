module Api
  module V1
    class BaseController < ApplicationController
      doorkeeper_for :all
      after_action :set_response_headers
      helper_method :current_user
      respond_to :json

      protected

      def current_user
        @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end

      def set_response_headers
        response.headers["Cache-Control"] = 'no-store'
      end

      def status_from_persistence(instance)
        (instance.persisted? ? :ok : :unprocessable_entity)
      end
    end
  end
end