class TweetsController < ApplicationController
  def new
    render "new"
  end
  
  def destroy
    Tweet.find_by(tweet_id: params[:id]).destroy
    @tweets = Tweet.all
    render "index"
  end
  
  def show
    Tweet.find_by(tweet_id: params[:id]).destroy
    @tweets = Tweet.all
    render "index"
  end
  
  def index
    @tweets = Tweet.all
  end


  def create
    if User.find_by(uid: params[:uid])
      Tweet.create(message: params[:message], user_id: params[:uid] )
      #あったら、既に登録済みエラー画面
      @tweets = Tweet.all
      @user_id = session[:login_uid]
      render 'top/main'
    else
      #なかったら、パスワードの暗号化、User.Create（）、登録完了画面
      render 'error'
    end
  end
end
