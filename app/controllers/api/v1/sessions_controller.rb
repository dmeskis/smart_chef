class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      render json: UserSerializer.new(user).serialized_json
    else
      render json: {errors: "Invalid credentials."}, status: 400
    end
  end

  private
    def session_params
      params.permit(:email, :password)
    end
end
