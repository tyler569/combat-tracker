class Api::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  # rescue_from User::NotAuthorized, with: :api_not_authorized

  private

  def api_not_authorized
    render json: { notice: "You are not authorized to perform that operation", error: "NotAuthorized" }
  end
end