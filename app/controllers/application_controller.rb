class ApplicationController < ActionController::Base
  before_action :verify_login

  private

  def verify_login
    @session = Session.find(session[:login_id].to_i)
    @user = @session.user
  rescue ActiveRecord::RecordNotFound
    raise User::NotAuthorized
  end
end
