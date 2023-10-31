class UsersController < ApplicationController
  def new
    render "new"
  end
  
  def destroy
    User.find_by(uid: params[:id]).destroy
    @users = User.all
    render "index"
  end
  
  def show
    User.find_by(uid: params[:id]).destroy
    @users = User.all
    render "index"
  end

  def index
    @users = User.all
  end


  def create
    #uidの存在チェック
    if User.find_by(uid: params[:uid])
      #あったら、既に登録済みエラー画面
      render "exist_error"
    else
      #なかったら、パスワードの暗号化、User.Create（）、登録完了画面
      User.create(uid: params[:uid], pass: BCrypt::Password.create(params[:pass]))
      render "registered"
    end
  end
end
