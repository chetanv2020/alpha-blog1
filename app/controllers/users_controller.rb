class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_param)
    
    if @user.save 
      flash[:success] = "Welcome to Alpha Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end 
  
  def edit
    
   @user = User.find(params[:id])
  
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_param)
      flash[:sucess] = "Your account was updated sucessfully"
      redirect_to articles_path
    else
      render 'edit'
      
    end
  
  end
  
  
  
  private
  
  def user_param
    params.require(:user).permit(:username, :email, :password)
  end
  
end