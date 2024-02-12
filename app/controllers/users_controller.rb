class UsersController < ApplicationController

  def index
  end

  def destroy
    @user = current_user

    if @user.destroy
      sign_out(current_user) # ユーザーをログアウトさせる
      redirect_to root_path, notice: 'アカウントが正常に削除されました。'
    else
      redirect_to root_path, alert: 'アカウントの削除中にエラーが発生しました。'
    end
  end


  def new
    @user = User.all
  end

end
