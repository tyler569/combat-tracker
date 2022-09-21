class Api::V1::UsersController < Api::ApiController
  def index
    @users = User.all
    render json: @users
  end

  def show
    if @user
      render json: @user
    else
      render json: @user.errors
    end
  end

  # def new
  #   @user = User.new
  # end

  # def edit
  # end

  # def create
  #   @user = User.create(user_params)

  #   if @user.save
  #     render json: @user
  #   else
  #     render json: @user.errors
  #   end
  # end

  # def update
  # end

  # def destroy
  #   @user.destroy

  #   render json: { notice: "User succesfully removed", success: true }
  # end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
