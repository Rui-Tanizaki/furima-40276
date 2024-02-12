class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.all
  end
end
