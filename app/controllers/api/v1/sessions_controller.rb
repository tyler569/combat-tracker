class Api::V1::SessionsController < Api::ApiController
  skip_before_action :verify_login

  def create
    user = User.where(username: login_params[:username]).first

    if !user
      login_failure
      return
    end

    if user.authenticate(login_params[:password])
      login_success user
    else
      login_failure
    end
  end

  private

  def login_params
    params.permit(:username, :password)
  end

  def login_success(user)
    s = Session.create(user: user)
    session[:login_id] = s.id.to_s
    render json: { notice: "Login succesful", success: true, session: session }
  end

  def login_failure
    render json: { notice: "Failed to authenticate", success: false }
  end
end
