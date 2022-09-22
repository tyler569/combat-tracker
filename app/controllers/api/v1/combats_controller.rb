class Api::V1::CombatsController < Api::ApiController
  before_action :set_combat, only: [:show, :edit, :update, :destroy]
  
  def index
    @combats = Combat.all
    render json: @combats.map { |c| c.to_json }
  end

  def show
    if @combat
      render json: @combat.to_json
    else
      render json: @combat.errors
    end
  end

  def new
    @combat = combat.new
  end

  def edit
  end

  def create
    @combat = Combat.create(combat_params)
    @combat.user = @user

    if @combat.save
      render json: @combat.to_json
    else
      render json: @combat.errors
    end
  end

  def update
  end

  def destroy
    @combat.destroy

    render json: { notice: "combat succesfully removed", success: true }
  end

  private

  def set_combat
    @combat = Combat.find(params[:id])
  end

  def combat_params
    params.permit(:name)
  end
end
