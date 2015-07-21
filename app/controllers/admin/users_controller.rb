class Admin::UsersController < ApplicationController  
  before_action :authenticate_user!
  #after_action :verify_authorized

  def index
    @users = User.all
    #authorize @users
  end

  def new
    @user = User.new

  end

  def show
    @user = User.find(params[:id])
    #authorize @user
  end

  def edit
    @user = User.find(params[:id])
    @roles = [:user, :approver, :worker, :admin]
    #authorize @user
  end

  # POST /requests
  # POST /requests.json
  def create

    params[:user][:password] = '12345678'
  
    @user = User.new(secure_params)    

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @user = User.find(params[:id])

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    
   # authorize @user
    if @user.update_attributes(secure_params)
      redirect_to admin_users_path, notice: "User updated."
    else
      redirect_to admin_users_path, alert: "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
  #  authorize user
    user.destroy
    redirect_to admin_users_path, notice: "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role, :last_name, :first_name, :phone, :other_phone, :email, :password, :password_confirmation)
  end

end
