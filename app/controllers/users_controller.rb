class UsersController < ApplicationController

  def index
  end

  def show
    redirect_to root_path
  end

  def new
    @user = User.all
  end

end
