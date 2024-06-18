class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :authenticate_user!, only: %i[edit show update index]
  load_and_authorize_resource

  def show; end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(current_user.id)
  end

  #PATCH/PUT /users/1 or /users/1.json
  def update

      case user_params[:role]
      when 'admin'
          respond_to do |format|
          if @user.update(regular: false, cashier: false, worker: false, admin: true)
            format.html { redirect_to users_path, notice: "User was successfully updated." } #?Ы
          else
            format.html { redirect_to users_path, status: :unprocessable_entity }
          end
        end
      when 'worker'
          respond_to do |format|
          if @user.update(regular: false, cashier: false, worker: true, admin: false)
            format.html { redirect_to users_path, notice: "User was successfully updated." } #?Ы
          else
            format.html { redirect_to users_path, status: :unprocessable_entity }
          end
        end
      when 'cashier'
          respond_to do |format|
          if @user.update(regular: false, cashier: true, worker: false, admin: false)
            format.html { redirect_to users_path, notice: "User was successfully updated." } #?Ы
          else
            format.html { redirect_to users_path, status: :unprocessable_entity }
          end
        end
      when 'regular'
          respond_to do |format|
          if @user.update(regular: true, cashier: false, worker: false, admin: false)
            format.html { redirect_to users_path, notice: "User was successfully updated." } #?Ы
          else
            format.html { redirect_to users_path, status: :unprocessable_entity }
          end
        end
      end

  end

  private
  def set_user
    @user = User.find_by(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:role)
  end
end
