module Api
  module V1
    class UsersController < BaseController
      skip_before_action :verify_authenticity_token, only: :sign_in
      skip_before_action :set_current_user, only: :sign_in
      skip_before_action :doorkeeper_authorize!, only: :sign_in

      def sign_in
        ctx = UserAuthentication::AuthorizeUserFromTokenContext.new(params)
        @user = ctx.execute

        render json: {}, status: status_from_persistence(@user)
      end
    end
  end
end