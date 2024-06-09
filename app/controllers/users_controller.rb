class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :authenticate_user!, only: %i[edit show update index]

  def show; end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(current_user.id)
  end

  #PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." } #?Ы
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_user
    @user = User.find_by(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email)
  end
end
