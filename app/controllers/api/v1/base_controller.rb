module Api
  module V1
    class BaseController < ApplicationController
      doorkeeper_for :all
      before_filter :set_current_user
      after_action :set_response_headers
      helper_method :current_user
      respond_to :json


      protected

      def current_user
        @current_user
      end

      def set_current_user
        @current_user = User.where(uid: request.headers['UserUID']).first
      end

      def set_response_headers
        response.headers["Cache-Control"] = 'no-store'
      end
    end
  end
end