class ApiController < InheritedResources::Base
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  
  http_basic_authenticate_with name: "hello", password: "world", :except => ["news", "tweet_filter"]
  protect_from_forgery with: :null_session 
  require 'json'
  require 'date'

  def tweet_filter
    start_time = (params[:fecha1]).to_date
    end_time = (params[:fecha2]).to_date



    @tweets = Tweet.date_filter(start_time, end_time)
    @friends = Friend.all
    @filter_api = []
    @retweet_list = Tweet.where.not(:origin_tweet => nil)
    @tweets.each do |tweet|
      @tweets_likes = Like.where(:tweet_id  => tweet.id)
      @tweet_retweet = Tweet.where(:origin_tweet => tweet.id)
      @retweets_from = Friend.where(:user_id => @retweet_list)
      @tweet_hash = {"id" => tweet.id}
      @tweet_hash.merge!("content"=> tweet.content)
      @tweet_hash.merge!("user_id"=> tweet.user_id)
      @tweet_hash.merge!("like_count"=> @tweets_likes.count)
      @tweet_hash.merge!("retweets_count"=> @tweet_retweet.count)
      @tweet_hash.merge!("rewtitted_form"=> @retweets_from.count)
      @filter_api << (@tweet_hash)
    end
    render :json => @filter_api
  end

  def news
    @tweets = Tweet.all
    @friends = Friend.all
    @users = User.all
    @tweet_api = []
    @retweet_user_list = []
    
    @tweets.each do |tweet|
      @tweets_likes = Like.where(:tweet_id  => tweet.id)
      @tweet_retweet = Tweet.where(:origin_tweet => tweet.id)

      @tweet_hash = {"id" => tweet.id}
      @tweet_hash.merge!("content"=> tweet.content)
      @tweet_hash.merge!("user_id"=> tweet.user_id)
      @tweet_hash.merge!("like_count"=> @tweets_likes.count)
      @tweet_hash.merge!("retweets_count"=> @tweet_retweet.count)
      if @tweet_retweet.first == nil
        @tweet_retweet = 0
        @tweet_hash.merge!("rewtitted_form"=> @tweet_retweet)
      else
        @tweet_retweet.each do |rt|
          @retweet_user_list << rt.user_id
        end
        @tweet_hash.merge!("rewtitted_from"=> @retweet_user_list)
        
      end
      
      @tweet_api << (@tweet_hash)


    end
    @final_api_tweet = @tweet_api
    render :json => @final_api_tweet
   
  end

  respond_to do |format|
    format.html { render "api/new", :layout => false  }

  end

  def create
    @tweet = Tweet.create(tweet_params)
    @tweet.save
    render json: @tweet
  end
    

  private

  def api_params
    params.require(:api).permit(:fecha1, :fecha2)
  end

  def tweet_params
    params.require(:tweet).permit(:content, :user_id, :tweet_id)
  end

end
