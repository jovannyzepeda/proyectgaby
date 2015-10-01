class AdminsController < ApplicationController
  before_action :autenticacion_admin!, only: [:destroy,:index,:new]
  #before_action :authenticate_user!, except: [:edit,:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new

    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Usuario Creado exitosamente." 
      redirect_to admins_path
      
    else
      flash[:notice] = "Datos Erroneos o password menor a 8 caracteres"
      render :action => 'new'
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user.destroy
      flash[:notice] = "Usuario eliminado correctamente"
      redirect_to admins_path
    end
   
  end 
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
end