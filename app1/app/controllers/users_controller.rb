class UsersController < ApplicationController
  before_action :get_login_user, only: [:index]

  def index
    @users = User.where.not(id: @login_user.id)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new
    user.name = params[:user][:name]
    user.password = params[:user][:password]
    user.save
    cookies[:user_id] = {
      :value => user.id,
      :expire => 1.year.from_now 
    }
    redirect_to '/'
  end
  
  def logout
    cookies.delete(:user_id)
  end
  
  def login
    @user = User.new
  end
  
  def send_login
    @user = User.find_by(
      name: params[:user][:name],
      password: params[:user][:password]
    )
    if @user.nil?
      redirect_to '/users/login'
      return
    end
    cookies[:user_id] = { :value => @user.id, :expire => 1.year.from_now }
    redirect_to '/'
  end
  
  def destroy
    @user = User.find_by(params[:id])
    @user.destroy
    redirect_to users_index_path
  end
  
end
