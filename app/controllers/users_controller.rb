class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :my_page, only: [:show]

  def index
    @users = User.all
  end

  def show
    @events_admin = Event.where(admin: @user)


  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
      if @user.update(user_params)
        redirect_to @user, flash: {success: "Votre compte a ete mis a jour" }
      else
        render :edit
      end
  end

  def destroy
    @user.destroy
    redirect_to users_url, flash: {success: "Votre compte a ete supprimé" } 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      begin
       @user = User.find(params[:id])
      rescue
        redirect_to events_path, flash: {danger: "Cet utilisateur n'existe pas !" }
      end
    end
    def user_params
      return params.require(:user).permit(:first_name, :last_name, :description)
    end

    def my_page
      unless current_user == User.find(params[:id])
        redirect_to events_path, flash: {danger: "Acces restreint !" }
      end
    end

end
