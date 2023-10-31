class LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    user = User.find_by(uid: session[:login_uid])
    if tweet.likes.find_by(user_id: user.id) == nil
      user.like_tweets << tweet
      redirect_to root_path
    else
      render 'like_exist_error'
    end
  end
  
  def index
    tweet = Tweet.find(params[:tweet_id])
    user = User.find_by(uid: session[:login_uid])
    if tweet.likes.find_by(user_id: user.id) == nil
      user.like_tweets << tweet
      redirect_to root_path
    else
      render 'like_exist_error'
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    user = User.find_by(uid: session[:login_uid])
    like = tweet.likes.find_by(user_id: user.id)
    if like != nil 
      like.destroy
      redirect_to root_path
    else
      render 'not_exist_error'
    end
  end
  
  def show
    tweet = Tweet.find(params[:id])
    user = User.find_by(uid: session[:login_uid])
    like = tweet.likes.find_by(user_id: user.id)
    if like != nil 
      like.destroy
      redirect_to root_path
    else
      render 'not_exist_error'
    end
  end
  
end