class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    render json: users,  status: :ok
  end

  # GET /users/1
  def show
    render json: @user,  status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user,  status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.soft_delete
    if @user.soft_deleted?
      render json: { message: "user deleted"}, status: :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def users
      @user = User.all.not_deleted
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:id, :firstName, :lastName, :email, :password, :photo, :role_id) 
    end          
end