class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.all
  end

end
