module Api
  module V1
    class UsersController < BaseController
      skip_before_filter :verify_authenticity_token, only: :sign_in
      skip_before_filter :set_current_user, only: :sign_in

      def sign_in
        ctx = UserAuthentication::FindOrCreateUserFromGoogleOauth2Context.new(params)
        @user = ctx.execute

        status = @user.persisted? ? :ok : :unprocessable_entity
        render json: {}, status: status_from_persistence(@user)
      end
    end
  end
end